operation
initializeIterations

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