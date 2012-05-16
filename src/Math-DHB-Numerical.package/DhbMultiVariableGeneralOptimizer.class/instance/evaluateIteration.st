operation
evaluateIteration
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "
	| optimizer |
	optimizer := DhbHillClimbingOptimizer forOptimizer: self.
	optimizer desiredPrecision: desiredPrecision;
			  maximumIterations: maximumIterations;
			  initialValue: result.
	result := optimizer evaluate.
	^optimizer precision