operation
evaluateIteration
		"Perform one step of bisection."
	result := ( positiveX + negativeX) * 0.5.
	( functionBlock value: result) > 0
		ifTrue: [ positiveX := result]
		ifFalse:[ negativeX := result].
	^self relativePrecision: ( positiveX - negativeX) abs