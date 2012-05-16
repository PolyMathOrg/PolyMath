operation
evaluateIteration
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 26/4/99 "
	| oldResult |
	oldResult := result.
	result := self higherOrderSum.
	^self relativePrecision: ( result - oldResult) abs