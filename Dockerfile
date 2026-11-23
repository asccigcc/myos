FROM ubuntu:24.04
RUN apt-get update && apt-get install -y \
    qemu-system-misc \
    gcc-riscv64-unknown-elf \
    gdb-multiarch \
    device-tree-compiler \
    make git \
&& rm -rf /var/lib/apt/lists/*
WORKDIR /myos
