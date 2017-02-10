operation
performSimplexOptimization
	"Private"

	| optimizer |
	optimizer := PMSimplexOptimizer forOptimizer: self.
	optimizer desiredPrecision: desiredPrecision sqrt; maximumIterations: maximumIterations; initialValue: result asPMVector.
	result := optimizer evaluate