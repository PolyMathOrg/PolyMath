operation
performSimplexOptimization
	"Private"

	| optimizer |
	optimizer := DhbSimplexOptimizer forOptimizer: self.
	optimizer desiredPrecision: desiredPrecision sqrt; maximumIterations: maximumIterations; initialValue: result asDhbVector.
	result := optimizer evaluate