#version 310 es

void f() {
  int i = 0;
  {
    while(true) {
      if ((i < 4)) {
      } else {
        break;
      }
      {
      }
      continue;
    }
  }
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
