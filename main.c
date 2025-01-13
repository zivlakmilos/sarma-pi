#include "debug.h"
#include "handler.h"
#include "lib.h"
#include "print.h"
#include "uart.h"

void KMain(void) {
  init_uart();

  printk("Hello, Raspberry Pi\r\n");
  printk("We are at EL %u\r\n", (uint64_t)get_el());

  // init_timer();
  init_interrupt_controller();
  enable_irq();

  while (1) {
  }
}
