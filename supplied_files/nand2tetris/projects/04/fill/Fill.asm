// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// LOOP
// 	Get keyboard

// 	if keyboard
// 		color = black
// 	else
// 		color = white
// 	SLOOP rows
// 		draw color
// 		+32 bits
		

// 	LOOP

@color
M = 0			// @16

@8191			// 8k screen memory
M = A			// n = 8k
D = M
@n				// @32
M = D


(LOOP)
	// Reset screen address
	@SCREEN
	D = A
	@address
	M = D		// address = 16384 (base address of the Hack screen)

	@KBD
	D = M		// D=0 if nothing, >0 if pressed
	@BLACK
	D;JGT		// jump to draw black if pressed

	// Draw white
	@color
	M = 0

	@DRAW
	0;JMP		// Draw screen (and thus loop back here)


(DRAW)
	// Draw screen with current @color

	@i
	M = 0		// i=0

	(SLOOP)
		@i
		D = M
		@n
		D = D - M
		@LOOP
		D;JGT		// if i > n goto END

		// Set first word in Screen to @color
		@color
		D = M
		@address
		A = M		// writing to memory using a pointer
		M = D		// RAM[address] = @color (16 pixels)

		@i
		M = M + 1	// i = i + 1
		@address
		M = M + 1	// address = address + 1
		@SLOOP
		0;JMP		// goto LOOP

(BLACK)
	// Draw black
	@color
	M = -1

	@DRAW
	0;JMP		// Draw screen
