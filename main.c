#include "print.h"
#include "uart.h"

void KMain(void) {
  init_uart();

  uint64_t value = 0x1234567890ABCDEF;

  printk("Hello, Raspberry Pi\r\n");
  printk("Test number %d\r\n", value);
  printk("Test number %x\r\n", value);

  while (1) {
  }
}
