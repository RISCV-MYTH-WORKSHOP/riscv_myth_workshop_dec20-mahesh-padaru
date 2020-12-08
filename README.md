# RISC-V MYTH Core

This RISC-V Core was developed as a part of "Microprocessor for You in Thirty Hours" Workshop, offered by VLSI System Design (VSD) and Redwood EDA.
RISC-V is an open-source instruction set architecture (ISA) based on RISC (Reduced Instruction Set Computer). This main goal of making this ISA open-source by its inventors was to enable any particular individual or company to build a CPU based on RISC-V ISA with a goal of this being computing standard in the next gen. 

More information about the ISA can be found here-  
[RISC-V Specifications](https://riscv.org/technical/specifications/)  
[RISC-V card](https://inst.eecs.berkeley.edu//~cs61c/fa17/img/riscvcard.pdf)  

### GCC Compiler for C
To compile : gcc <prog.c>
Run the program : ./a.out

### GCC Compiler for RISC-V
To compile : `riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o <prog.o> <prog.c>`   
        `-O1`            compiler name; -Ofast provides a smaller list of assembler instructions when compiled    
        `-mabi=lp64`     lp-longint pointer    
        `-march=rv64i`   RISC-V architecture    
        `-o    `         output object name    

Run the program : `spike pk <prog.o>`  

Object dump (To see the program counter) :   `riscv64-unknown-elf-objdump -d <obj.o>`    
       `-d `            "Disassemble" the given object and prints the assembly code of the C code provided.    
       
Debugger :
  `spike -d pk <obj.o>`     
   `:until pc 0 100cb`      Assembly code runs until the instructions previous to the address given 
        `:reg 0 a0`              Output the contents of register a0 on core0  
        `:reg 0 sp`              Print out the contents of stack pointer  
        `:<Enter key>`           To run the next instruction  


