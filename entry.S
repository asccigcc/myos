  .section .text.boot # must match the linker rule
  .globl _start
_start:
  li t0, 0x10000000
  li t1, 0x41
  sb t1, 0(t0)

  la sp, stack_top # point the stack pointer at the top of our stack defined on linker.ld
  call kmain # jump into C
spin:
  j spin # if kmain ever returns, park here
