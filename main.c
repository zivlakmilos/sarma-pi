#include "debug.h"
#include "print.h"
#include "uart.h"

void KMain(void) {
  init_uart();

  printk("Hello, Raspberry Pi\r\n");

  ASSERT(0);

  while (1) {
  }
}
