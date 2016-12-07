operation
evaluateIteration
	self addPointAt: self nextXValue.
	bestPoints removeAt: self indexOfOuterPoint.
	^self computePrecision