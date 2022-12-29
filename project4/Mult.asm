// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.


//	one = R0
//	two = R1
//	i = 0
//	
//	LOOP
//		if i > one GOTO END
//		else
//			R2 = R2 + two


@R0
D = M
@one			// @16
M = D			// one = RAM[0]

@R1
D = M
@two			// @17
M = D			// two = RAM[1]

@R2
M = 0			// R2 = 0

@i				// @18
M = 1			// i = 0

// Loop @one times
(LOOP)

	// Check for loop end. 
	@i
	D = M
	@one
	D = D - M		// 0...R0 - i should be negative until end
	@END			// @28
	D;JGT			// if i - R0 > 0 goto END

	// Add @two to R2
	@R2
	D = M			// Get existing sum
	@two
	D = D + M		// Compute new sum
	@R2
	M = D			// Store back in R2

	// increment i
	@i
   	M = M + 1		// i = i + 1

	// loop
	@LOOP
	0;JMP			// goto loop

(END)
	@END
	0;JMP