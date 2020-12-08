riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o <prog.o> <prog.c>

Use -Ofast instead of -O1

Run using GCC:
./<prog.o>

spike pk <prog.o>
spike -d pk <obj>

until pc 0 <target_pc>
