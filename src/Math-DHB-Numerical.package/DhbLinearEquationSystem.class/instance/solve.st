transformation
solve
		"Private - Perform LU decomposition of the system.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	1 to: rows size do: [ :n | self pivotStepAt: n].
	solutions := Array new: ( (rows at: 1) size - rows size).