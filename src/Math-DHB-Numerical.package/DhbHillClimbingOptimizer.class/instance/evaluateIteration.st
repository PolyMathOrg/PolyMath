operation
evaluateIteration
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "
	| oldResult |
	precision := 1.0.
	bestPoints inject: result
				 into: [ :prev :each | ( self minimizeDirection: each from: prev)].
	self shiftDirections.
	self minimizeDirection: bestPoints last.
	oldResult := result.
	result := bestPoints last origin.
	precision := 0.0.
	result with: oldResult do:
		[ :x0 :x1 |
		  precision := ( self precisionOf: (x0 - x1) abs relativeTo: x0 abs) max: precision.
		].
	^precision