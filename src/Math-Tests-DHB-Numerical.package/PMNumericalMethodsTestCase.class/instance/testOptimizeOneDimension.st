optimization
testOptimizeOneDimension
	"Code example 11.1"

	| distr finder maximum |
	distr := PMGammaDistribution shape: 2 scale: 5.
	finder := PMOneVariableFunctionOptimizer maximizingFunction: distr.
	finder desiredPrecision: 1.0e-6.
	maximum := finder evaluate.
	self assert: (maximum - 5) abs < 1.0e-6.
	self assert: finder precision < 1.0e-6