.section .text
.global start

start:
  mrs x0, mpidr_el1
  and x0, x0, #3
  cmp x0, #0
  beq kernel_entry

end:
  b end

kernel_entry:
  mrs x0, currentel
  lsr x0, x0, #2
  cmp x0, #2
  bne end

  msr sctlr_el1, xzr
  mov x0, #(1 << 31)
  msr hcr_el2, x0

  mov x0, #0b1111000101
  msr spsr_el2, x0

  adr x0, el1_entry
  msr elr_el2, x0

  eret

el1_entry:
  mov sp, #0x80000

  ldr x0, =bss_start
  ldr x1, =bss_end
  sub x2, x1, x0
  mov x1, #0
  bl memset

  ldr x0, =vector_table
  msr vbar_el1, x0

  bl KMain
  mov x0, #0
  msr spsr_el1, x0
  adr x0, el0_entry
  msr elr_el1, x0
  eret

el0_entry:
  b end
