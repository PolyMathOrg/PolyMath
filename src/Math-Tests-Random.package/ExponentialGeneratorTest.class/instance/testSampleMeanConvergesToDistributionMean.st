tests
testSampleMeanConvergesToDistributionMean
	"testing a random sample seems suspect. We use a 5% interval here"

	| eg arr |
	eg := PMExponentialGenerator mean: 10.
	arr := Array new: 10000.
	(1 to: 10000) do: [ :index | arr at: index put: eg next ].
	self
		assert: (arr average between: eg mean * 0.95 and: eg mean * 1.05)