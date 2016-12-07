operation
performSimplexOptimization
	"Private"

	| optimizer |
	optimizer := PMSimplexOptimizer forOptimizer: self.
	optimizer desiredPrecision: desiredPrecision sqrt; maximumIterations: maximumIterations; initialValue: result asDhbVector.
	result := optimizer evaluate