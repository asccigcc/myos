OUTPUT_ARCH("riscv")
ENTRY(_start)

SECTIONS
{
  . = 0x80200000;

  .text : {
    *(.text.boot) /* _start goes first, guaranteed */
    *(.text .text.*)
  }

  .rodata : { *(.rodata .rodata.*) }
  .data   : { *(.data .data.*) }
  .bss    : { *(.bss .bss.*) }

  . = ALIGN(16);
  . += 0x4000;
  stack_top = .;
}
