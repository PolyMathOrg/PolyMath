operation
evaluateIteration
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 26/4/99 "
	| interpolation |
	points addLast: (points last x * 0.25) @ self higherOrderSum.
	points size < order
		ifTrue: [ ^1].
	interpolation := interpolator valueAndError: 0.
	points removeFirst.
	result := interpolation at: 1.
	^self relativePrecision: ( interpolation at: 2) abs