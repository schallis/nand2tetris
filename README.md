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
- Every possible boolean function can be constructed using `AND`, `OR` and `NOT`. But we can simplify further.
	-  `OR` can be constructed from `AND` and `NOT` using Demorgan laws `X OR Y === NOT(NOT X AND NOT Y)`
	- `NAND` is the negation of `X AND Y`. This suffices to construct all others since we can define `AND` and `NOT` in terms of `NAND`.
	- `NOT X === X NAND X`
	- `X AND Y === NOT(X NAND Y) === (X NAND Y) NAND (X NAND Y)`

