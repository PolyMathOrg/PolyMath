operation
evaluateIteration
		"Perform one step of bisection.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 22/4/99 "
	result := ( positiveX + negativeX) * 0.5.
	( functionBlock value: result) > 0
		ifTrue: [ positiveX := result]
		ifFalse:[ negativeX := result].
	^self relativePrecision: ( positiveX - negativeX) abs