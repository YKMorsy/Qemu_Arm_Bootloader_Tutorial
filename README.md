Based on x86 bootloader from the following tutorial:

https://www.joe-bergeron.com/posts/Writing%20a%20Tiny%20x86%20Bootloader/

- Using ARM instead, which doesn't have bios, but can use qemu bios flag to run bootloader from 0x00000000 address.
- boot.s prints message using UART
- Using versatilepb
- To make work on RaspberryPi, change the address of the UART registers in the boot.s file using info found here (https://wiki.osdev.org/Raspberry_Pi_Bare_Bones)
