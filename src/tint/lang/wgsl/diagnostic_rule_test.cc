// Copyright 2023 The Dawn & Tint Authors
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

////////////////////////////////////////////////////////////////////////////////
// File generated by 'tools/src/cmd/gen' using the template:
//   src/tint/lang/wgsl/diagnostic_rule_test.cc.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#include <string>

#include "gtest/gtest.h"

#include "src/tint/lang/wgsl/diagnostic_rule.h"
#include "src/tint/utils/text/string.h"

namespace tint::wgsl {
namespace {

namespace core_diagnostic_rule_tests {

namespace parse_print_tests {

struct Case {
    const char* string;
    CoreDiagnosticRule value;
};

inline std::ostream& operator<<(std::ostream& out, Case c) {
    return out << "'" << std::string(c.string) << "'";
}

static constexpr Case kValidCases[] = {
    {"derivative_uniformity", CoreDiagnosticRule::kDerivativeUniformity},
    {"subgroup_uniformity", CoreDiagnosticRule::kSubgroupUniformity},
};

static constexpr Case kInvalidCases[] = {
    {"deriative_unccformity", CoreDiagnosticRule::kUndefined},
    {"dlivative_3iformiy", CoreDiagnosticRule::kUndefined},
    {"derivative_uniforVity", CoreDiagnosticRule::kUndefined},
    {"s1bgroup_uniformity", CoreDiagnosticRule::kUndefined},
    {"subgrouqq_unifJrmty", CoreDiagnosticRule::kUndefined},
    {"sub77roup_ulliformity", CoreDiagnosticRule::kUndefined},
};

using CoreDiagnosticRuleParseTest = testing::TestWithParam<Case>;

TEST_P(CoreDiagnosticRuleParseTest, Parse) {
    const char* string = GetParam().string;
    CoreDiagnosticRule expect = GetParam().value;
    EXPECT_EQ(expect, ParseCoreDiagnosticRule(string));
}

INSTANTIATE_TEST_SUITE_P(ValidCases, CoreDiagnosticRuleParseTest, testing::ValuesIn(kValidCases));
INSTANTIATE_TEST_SUITE_P(InvalidCases,
                         CoreDiagnosticRuleParseTest,
                         testing::ValuesIn(kInvalidCases));

using CoreDiagnosticRulePrintTest = testing::TestWithParam<Case>;

TEST_P(CoreDiagnosticRulePrintTest, Print) {
    CoreDiagnosticRule value = GetParam().value;
    const char* expect = GetParam().string;
    EXPECT_EQ(expect, ToString(value));
}

INSTANTIATE_TEST_SUITE_P(ValidCases, CoreDiagnosticRulePrintTest, testing::ValuesIn(kValidCases));

}  // namespace parse_print_tests

}  // namespace core_diagnostic_rule_tests

namespace chromium_diagnostic_rule_tests {

namespace parse_print_tests {

struct Case {
    const char* string;
    ChromiumDiagnosticRule value;
};

inline std::ostream& operator<<(std::ostream& out, Case c) {
    return out << "'" << std::string(c.string) << "'";
}

static constexpr Case kValidCases[] = {
    {"unreachable_code", ChromiumDiagnosticRule::kUnreachableCode},
};

static constexpr Case kInvalidCases[] = {
    {"pqnreachableHHcode", ChromiumDiagnosticRule::kUndefined},
    {"unrechcbe_cov", ChromiumDiagnosticRule::kUndefined},
    {"unreachGblecode", ChromiumDiagnosticRule::kUndefined},
};

using ChromiumDiagnosticRuleParseTest = testing::TestWithParam<Case>;

TEST_P(ChromiumDiagnosticRuleParseTest, Parse) {
    const char* string = GetParam().string;
    ChromiumDiagnosticRule expect = GetParam().value;
    EXPECT_EQ(expect, ParseChromiumDiagnosticRule(string));
}

INSTANTIATE_TEST_SUITE_P(ValidCases,
                         ChromiumDiagnosticRuleParseTest,
                         testing::ValuesIn(kValidCases));
INSTANTIATE_TEST_SUITE_P(InvalidCases,
                         ChromiumDiagnosticRuleParseTest,
                         testing::ValuesIn(kInvalidCases));

using ChromiumDiagnosticRulePrintTest = testing::TestWithParam<Case>;

TEST_P(ChromiumDiagnosticRulePrintTest, Print) {
    ChromiumDiagnosticRule value = GetParam().value;
    const char* expect = GetParam().string;
    EXPECT_EQ(expect, ToString(value));
}

INSTANTIATE_TEST_SUITE_P(ValidCases,
                         ChromiumDiagnosticRulePrintTest,
                         testing::ValuesIn(kValidCases));

}  // namespace parse_print_tests

}  // namespace chromium_diagnostic_rule_tests

}  // namespace
}  // namespace tint::wgsl
