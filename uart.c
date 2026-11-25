#include "uart.h"

#define UART_BASE 0x10000000UL
#define UART_THR 0
#define UART_LSR 5
#define LSR_THRE (1 << 5)

static volatile unsigned char *uart_reg(int offset)
{
  return (volatile unsigned char *)(UART_BASE + offset);
}

void uart_putc(char c)
{
  while((*uart_reg(UART_LSR) & LSR_THRE) == 0) {

  }
  *uart_reg(UART_THR) = c;
}

void uart_puts(const char *s)
{
  while(*s != '\0') {
    if (*s == '\n'){
      uart_putc('\r');
    }
    uart_putc(*s);
    s++;
  }
}
