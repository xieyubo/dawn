// Copyright 2017 The Dawn Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "dawn_native/null/NullBackend.h"

#include "dawn_native/BackendConnection.h"
#include "dawn_native/Commands.h"
#include "dawn_native/NullBackend.h"

#include <spirv-cross/spirv_cross.hpp>

namespace dawn_native { namespace null {

    // Implementation of pre-Device objects: the null adapter, null backend connection and Connect()

    class Adapter : public AdapterBase {
      public:
        Adapter(InstanceBase* instance) : AdapterBase(instance, BackendType::Null) {
        }
        virtual ~Adapter() = default;

      private:
        ResultOrError<DeviceBase*> CreateDeviceImpl() override {
            return {new Device};
        }
    };

    class Backend : public BackendConnection {
      public:
        Backend(InstanceBase* instance) : BackendConnection(instance, BackendType::Null) {
        }

        std::vector<std::unique_ptr<AdapterBase>> DiscoverDefaultAdapters() override {
            // There is always a single Null adapter because it is purely CPU based and doesn't
            // depend on the system.
            std::vector<std::unique_ptr<AdapterBase>> adapters;
            adapters.push_back(std::make_unique<Adapter>(GetInstance()));
            return adapters;
        }
    };

    dawnDevice CreateDevice() {
        return reinterpret_cast<dawnDevice>(new Device);
    }

    BackendConnection* Connect(InstanceBase* instance) {
        return new Backend(instance);
    }

    // Device

    Device::Device() {
        InitFakePCIInfo();
    }

    Device::~Device() {
    }

    ResultOrError<BindGroupBase*> Device::CreateBindGroupImpl(
        const BindGroupDescriptor* descriptor) {
        return new BindGroup(this, descriptor);
    }
    ResultOrError<BindGroupLayoutBase*> Device::CreateBindGroupLayoutImpl(
        const BindGroupLayoutDescriptor* descriptor) {
        return new BindGroupLayout(this, descriptor);
    }
    ResultOrError<BufferBase*> Device::CreateBufferImpl(const BufferDescriptor* descriptor) {
        return new Buffer(this, descriptor);
    }
    CommandBufferBase* Device::CreateCommandBuffer(CommandBufferBuilder* builder) {
        return new CommandBuffer(builder);
    }
    ResultOrError<ComputePipelineBase*> Device::CreateComputePipelineImpl(
        const ComputePipelineDescriptor* descriptor) {
        return new ComputePipeline(this, descriptor);
    }
    InputStateBase* Device::CreateInputState(InputStateBuilder* builder) {
        return new InputState(builder);
    }
    ResultOrError<PipelineLayoutBase*> Device::CreatePipelineLayoutImpl(
        const PipelineLayoutDescriptor* descriptor) {
        return new PipelineLayout(this, descriptor);
    }
    ResultOrError<QueueBase*> Device::CreateQueueImpl() {
        return new Queue(this);
    }
    RenderPassDescriptorBase* Device::CreateRenderPassDescriptor(
        RenderPassDescriptorBuilder* builder) {
        return new RenderPassDescriptor(builder);
    }
    ResultOrError<RenderPipelineBase*> Device::CreateRenderPipelineImpl(
        const RenderPipelineDescriptor* descriptor) {
        return new RenderPipeline(this, descriptor);
    }
    ResultOrError<SamplerBase*> Device::CreateSamplerImpl(const SamplerDescriptor* descriptor) {
        return new Sampler(this, descriptor);
    }
    ResultOrError<ShaderModuleBase*> Device::CreateShaderModuleImpl(
        const ShaderModuleDescriptor* descriptor) {
        auto module = new ShaderModule(this, descriptor);

        spirv_cross::Compiler compiler(descriptor->code, descriptor->codeSize);
        module->ExtractSpirvInfo(compiler);

        return module;
    }
    SwapChainBase* Device::CreateSwapChain(SwapChainBuilder* builder) {
        return new SwapChain(builder);
    }
    ResultOrError<TextureBase*> Device::CreateTextureImpl(const TextureDescriptor* descriptor) {
        return new Texture(this, descriptor);
    }
    ResultOrError<TextureViewBase*> Device::CreateTextureViewImpl(
        TextureBase* texture,
        const TextureViewDescriptor* descriptor) {
        return new TextureView(texture, descriptor);
    }

    void Device::InitFakePCIInfo() {
        mPCIInfo.name = "Null backend";
    }

    const dawn_native::PCIInfo& Device::GetPCIInfo() const {
        return mPCIInfo;
    }

    Serial Device::GetCompletedCommandSerial() const {
        return mCompletedSerial;
    }

    Serial Device::GetLastSubmittedCommandSerial() const {
        return mLastSubmittedSerial;
    }

    void Device::TickImpl() {
        SubmitPendingOperations();
    }

    void Device::AddPendingOperation(std::unique_ptr<PendingOperation> operation) {
        mPendingOperations.emplace_back(std::move(operation));
    }
    void Device::SubmitPendingOperations() {
        for (auto& operation : mPendingOperations) {
            operation->Execute();
        }
        mPendingOperations.clear();

        mCompletedSerial = mLastSubmittedSerial;
        mLastSubmittedSerial++;
    }

    // Buffer

    struct BufferMapReadOperation : PendingOperation {
        virtual void Execute() {
            buffer->MapReadOperationCompleted(serial, ptr, isWrite);
        }

        Ref<Buffer> buffer;
        void* ptr;
        uint32_t serial;
        bool isWrite;
    };

    Buffer::Buffer(Device* device, const BufferDescriptor* descriptor)
        : BufferBase(device, descriptor) {
        if (GetUsage() & (dawn::BufferUsageBit::TransferDst | dawn::BufferUsageBit::MapRead |
                          dawn::BufferUsageBit::MapWrite)) {
            mBackingData = std::unique_ptr<char[]>(new char[GetSize()]);
        }
    }

    Buffer::~Buffer() {
    }

    void Buffer::MapReadOperationCompleted(uint32_t serial, void* ptr, bool isWrite) {
        if (isWrite) {
            CallMapWriteCallback(serial, DAWN_BUFFER_MAP_ASYNC_STATUS_SUCCESS, ptr);
        } else {
            CallMapReadCallback(serial, DAWN_BUFFER_MAP_ASYNC_STATUS_SUCCESS, ptr);
        }
    }

    void Buffer::SetSubDataImpl(uint32_t start, uint32_t count, const uint8_t* data) {
        ASSERT(start + count <= GetSize());
        ASSERT(mBackingData);
        memcpy(mBackingData.get() + start, data, count);
    }

    void Buffer::MapReadAsyncImpl(uint32_t serial, uint32_t start, uint32_t count) {
        MapAsyncImplCommon(serial, start, count, false);
    }

    void Buffer::MapWriteAsyncImpl(uint32_t serial, uint32_t start, uint32_t count) {
        MapAsyncImplCommon(serial, start, count, true);
    }

    void Buffer::MapAsyncImplCommon(uint32_t serial, uint32_t start, uint32_t count, bool isWrite) {
        ASSERT(start + count <= GetSize());
        ASSERT(mBackingData);

        auto operation = new BufferMapReadOperation;
        operation->buffer = this;
        operation->ptr = mBackingData.get() + start;
        operation->serial = serial;
        operation->isWrite = isWrite;

        ToBackend(GetDevice())->AddPendingOperation(std::unique_ptr<PendingOperation>(operation));
    }

    void Buffer::UnmapImpl() {
    }

    // CommandBuffer

    CommandBuffer::CommandBuffer(CommandBufferBuilder* builder)
        : CommandBufferBase(builder), mCommands(builder->AcquireCommands()) {
    }

    CommandBuffer::~CommandBuffer() {
        FreeCommands(&mCommands);
    }

    // Queue

    Queue::Queue(Device* device) : QueueBase(device) {
    }

    Queue::~Queue() {
    }

    void Queue::SubmitImpl(uint32_t, CommandBufferBase* const*) {
        ToBackend(GetDevice())->SubmitPendingOperations();
    }

    // SwapChain

    SwapChain::SwapChain(SwapChainBuilder* builder) : SwapChainBase(builder) {
        const auto& im = GetImplementation();
        im.Init(im.userData, nullptr);
    }

    SwapChain::~SwapChain() {
    }

    TextureBase* SwapChain::GetNextTextureImpl(const TextureDescriptor* descriptor) {
        return GetDevice()->CreateTexture(descriptor);
    }

    void SwapChain::OnBeforePresent(TextureBase*) {
    }

}}  // namespace dawn_native::null
