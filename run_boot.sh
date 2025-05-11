#!/bin/bash

docker run --rm -v "$PWD":/mnt -w /mnt armdev \
    bash -c "\
        set -e && \
        arm-none-eabi-as boot.s -o boot.o && \
        arm-none-eabi-ld -T linker.ld -o boot.elf boot.o && \
        arm-none-eabi-objcopy -O binary boot.elf boot.bin && \
        qemu-system-arm \
            -M versatilepb \
            -m 128M \
            -bios boot.bin \
            -nographic"

