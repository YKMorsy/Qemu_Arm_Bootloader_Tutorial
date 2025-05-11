FROM debian:bullseye

RUN apt update && apt install -y gcc-arm-none-eabi binutils-arm-none-eabi qemu-system-arm make

ENV QEMU_AUDIO_DRV=none

WORKDIR /mnt

