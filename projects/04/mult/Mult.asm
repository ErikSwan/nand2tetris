// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm
// Author: Erik Swan (erik@erikswan.com)

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    // initialize R2 = 0
    @R2
    M=0

// Multiplication loop
(LOOP)
    // if R1 == 0, goto END
    @R1
    D=M
    @END
    D;JEQ
    // R2 += R0
    @R0
    D=M
    @R2
    M=D+M
    // R1--
    @R1
    M=M-1
    // goto LOOP
    @LOOP
    0;JMP

// Infinite loop to terminate program
(END)
    @END
    0;JMP
