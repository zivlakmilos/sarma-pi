ENTRY(start)
SECTIONS
{
  . = 0x80000;

  .text : {
    boot.o(.text)
    *(.text)
  }

  .rodata : {
    *(.text)
  }

  . = ALIGN(16);
  .data : {
    *(.data)
  }

  .bss : {
    bss_start = .;
    *(.bss)
    bss_end = .;
  }
}
