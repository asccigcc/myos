# MyOS

This is a pet project and learning space to explore how to create a small
kernel.

I'm using the Risc-v architecture with OpenSBI since this is an educational project and these tools make easy the lerning curve.

# How to run

You can use docker, i like this way because make it easy to transport and not mess with my host computer. So you can start the project with the following command:

```
docker build -t osdev .
```

To enter bash and run the risc commands and qemu:
```
docker run --rm -it -v "$PWD":/os osdev bash
```

Inside the bash you can go to `/os` directory where is allocated the files used to run the kernel, then you can run the following commands to prepare the kernel compilation:

```
riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64d -mcmodel=medany \
  -ffreestanding -nostdlib -O2 -g -Wall \
  -T linker.ld entry.S main.c -o kernel.elf
```

This will prepare the `kernel.elf` which is the one that we will use qieh qemu with the following command:
```
qemu-system-riscv64 -machine virt -nographic -bios default -kernel kernel.elf
```

# TODO

The project stills in progress so for now is a very basic main.c file that prints the letter B on the screen.

My goal is to have a very basic Unix Like OS with the only point to understand how Unix works, understand more the internals of an OS, the difficult to build a project like this and follow the steps of the kernel developer.
