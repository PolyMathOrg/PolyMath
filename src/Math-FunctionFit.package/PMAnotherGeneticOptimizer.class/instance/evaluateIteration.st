operation
evaluateIteration
	self nextGeneration.
	self mixupGeneration.
	^ self computePrecision: bestPoints first position first