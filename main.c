#include "uart.h"

void KMain(void) {
  init_uart();

  write_string("Hello, Raspberry Pi\r\n");

  while (1) {
  }
}
