operation
evaluateIteration
	| oldResult |
	oldResult := result.
	result := self higherOrderSum.
	^self relativePrecision: ( result - oldResult) abs