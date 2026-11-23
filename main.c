void kmain(void)
{
  volatile char *uart = (volatile char *)0x10000000;
  *uart = 'B';

  while (1) {
  }
}
