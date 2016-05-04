operation
evaluateIteration
	| optimizer |
	optimizer := PMHillClimbingOptimizer forOptimizer: self.
	optimizer desiredPrecision: desiredPrecision;
			  maximumIterations: maximumIterations;
			  initialValue: result.
	result := optimizer evaluate.
	^optimizer precision