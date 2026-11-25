#include "uart.h"

void kmain(void)
{
  uart_puts("Hello from my kernel!\n");

  while (1) {
  }
}
