operation
evaluateIteration
		"Compute one step of Newton's zero finding method. Answers the estimated precision.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "
	| delta |
	delta := ( functionBlock value: result) / ( derivativeBlock value: result).
	result := result - delta.
	^self relativePrecision: delta abs