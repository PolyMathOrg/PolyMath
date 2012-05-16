operation
evaluateIteration
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	| x1 x2 |
	x1 := ( bestPoints at: 1) position.
	x2 := ( bestPoints at: 2) position.
	self addPointAt: ( x1 * 3 - ( x2 * 2)).
	precision := ( x2 - x1) * ( ( bestPoints at: 3) position - x1).
	self hasConverged
		ifFalse:[ bestPoints removeLast].
	^precision