operation
performSimplexOptimization
	"Private - 
	(c) Copyrights Didier BESSET, 2000, all rights reserved. 
	Initial code: 2/29/00"

	| optimizer |
	optimizer := DhbSimplexOptimizer forOptimizer: self.
	optimizer desiredPrecision: desiredPrecision sqrt; maximumIterations: maximumIterations; initialValue: result asVector.
	result := optimizer evaluate