operation
evaluate
	"Perform the iteration until either the desired precision is attained or the number of iterations exceeds the maximum.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

	iterations := 0.
	self initializeIterations.
	
	[iterations := iterations + 1.
	precision := self evaluateIteration.
	self hasConverged or: [iterations >= maximumIterations]] 
			whileFalse: [].
	self finalizeIterations.
	^self result