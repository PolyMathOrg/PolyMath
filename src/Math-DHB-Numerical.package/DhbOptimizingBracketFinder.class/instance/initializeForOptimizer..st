initialization
initializeForOptimizer: aFunctionOptimizer
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	super initializeForOptimizer: aFunctionOptimizer.
	bestPoints := aFunctionOptimizer bestPoints.
	^self