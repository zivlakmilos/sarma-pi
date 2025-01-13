CC = aarch64-linux-gnu-gcc
AS = aarch64-linux-gnu-gcc
LD = aarch64-linux-gnu-ld
OBJC = aarch64-linux-gnu-objcopy

CFLAGS = -std=c99 -ffreestanding -mgeneral-regs-only
ASFLAGS = -c
LDFLAGS = -nostdlib
OBJCFLAGS = -O binary

objects = \
	boot.o \
	lib.o \
	uart.o \
	main.o

all: kernel.img

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

%.o: %.S
	$(AS) $(ASFLAGS) -o $@ -c $<

kernel: link.ld $(objects)
	$(LD) $(LDFLAGS) -T $< -o $@ $(objects)

kernel.img: kernel
	$(OBJC) $(OBJCFLAGS) $< $@

runp3: kernel.img
	qemu-system-aarch64 -M raspi3b -serial stdio -kernel kernel.img

runp4: kernel.img
	qemu-system-aarch64 -M raspi4b -serial stdio -kernel kernel.img

run: runp3

clean:
	rm -Rf $(objects) kernel kernel.img
