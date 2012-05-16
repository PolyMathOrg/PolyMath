operation
evaluateIteration
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	self addPointAt: self nextXValue.
	bestPoints removeAtIndex: self indexOfOuterPoint.
	^self computePrecision