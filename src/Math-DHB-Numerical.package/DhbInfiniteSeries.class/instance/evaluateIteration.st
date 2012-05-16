operation
evaluateIteration
		"Perform one iteration.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/3/99 "
	| delta |
	delta := termServer termAt: iterations.
	result := result + delta.
	^self precisionOf: delta abs relativeTo: result abs