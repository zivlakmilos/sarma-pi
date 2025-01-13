#include "print.h"
#include "stdint.h"

void handler(uint64_t numid, uint64_t esr, uint64_t elr) {
  switch (numid) {
  case 1:
    printk("sync error at %x: %x\r\n", elr, esr);
    while (1) {
    }
    break;
  default:
    printk("uknown exception\r\n");
    while (1) {
    }
  }
}
