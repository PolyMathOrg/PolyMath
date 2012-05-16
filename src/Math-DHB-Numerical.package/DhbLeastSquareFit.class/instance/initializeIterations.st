operation
initializeIterations
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

	| n |
	n := self numberOfParameters.
	constants := (DhbVector new: n)
				atAllPut: 0;
				yourself.
	equations := (1 to: n) collect: 
					[:k | 
					(DhbVector new: n)
						atAllPut: 0;
						yourself]