// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm
// Author: Erik Swan (erik@erikswan.com)

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

    // initialize i = 0
    @i
    M=0

// Draw loop
(LOOP)
    // scrn_p = SCREEN + (i & 0x1FFF)
    @i
    D=M
    @8191 // 0x1FFF
    D=D&A
    @SCREEN
    D=A+D
    @scrn_p
    M=D
    // i++
    @i
    M=M+1
    // if KBD == 0, goto CLEAR
    @KBD
    D=M
    @CLEAR
    D;JEQ

// Draw black
(FILL)
    // *scrn_p = -1
    @scrn_p
    A=M
    M=-1
    // goto LOOP
    @LOOP
    0;JMP

// Draw white
(CLEAR)
    // *scrn_p = 0
    @scrn_p
    A=M
    M=0
    // goto LOOP
    @LOOP
    0;JMP
