operation
initializeIterations

	| n |
	n := self numberOfParameters.
	constants := (PMVector new: n)
				atAllPut: 0;
				yourself.
	equations := (1 to: n) collect: 
					[:k | 
					(PMVector new: n)
						atAllPut: 0;
						yourself]