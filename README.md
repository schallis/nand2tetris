# nand2tetris 

https://www.coursera.org/learn/build-a-computer/home/week/1
https://www.nand2tetris.org/book

## Week 1

**Unit 1.1** How to construct function from Truth table
- Start with the first row of value one. Come up with a function that only satisfies that row 
- Go to next row that has value one and do the same
- Repeat for all rows of value one, then `OR` all those statements together
- Then simplify the expression using laws
	- There is no efficient algorithmn for finding the shortest expresssion. This is an NP hard problem.
- Every possible boolean function can be constructed using `AND`, `OR` and `NOT`. But we can simplify further to just use `NAND`:
	-  `OR` can be constructed from `AND` and `NOT` using Demorgan laws `X OR Y === NOT(NOT X AND NOT Y)`
	- `NAND` is the negation of `X AND Y`. This suffices to construct all others since we can define `AND` and `NOT` in terms of `NAND`.
	- `NOT X === X NAND X`
	- `X AND Y === NOT(X NAND Y) === (X NAND Y) NAND (X NAND Y)`

**Unit 1.6** Handling multiple input as buses
- Convenient to treat groups of inputs as a single 'bus'
- Has support in HDL for it

**Questions**
- You can build computers primitives other than `NAND` such as `NOR`. Depends on the physical implementation, costs etc.

## Week 2

- We only need addition to be able to perform other functions such as negation and comparisons
- Can build adders for single bits, and 16 bits

**Unit 2.3** Negation
- Using a sign bit is ineligant and inefficient (can represent 0 and -0)
- Overflow of MSB we normally just throw away. We end up with module `2^n`.
- Twos complement
	- Negative is represented by `2^n-x`
	- We get an extra negative number 0-7 and -1 to -8 for 16 bits
	- We can add negative numbers using a regular adder and get the correct result
		- Because `y - x == y + (-x)`
	- To compute the twos complement:
		- Flip the binary bits and add one
		- This is a math trick. We rewrite `2^n-x` as `1+(2^n-1)-x`. Since `2^n-1` is always all ones in binary. Subtracting from this is easy because you don't need any borrows (carries) so it becomes a simple `Not` operation i.e. flip the bits. Then we simply add back the one we subtracted.

**Unit 2.4** ALU
- The ALU computes a function on two inputs and outputs the results. It can compute many functions such as `Add`, `Or`, `Xor` etc.

