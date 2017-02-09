tests
testSampleMeanConvergesToDistributionMean
	"testing a random sample seems suspect. We use a 5% interval here"

	| eg arr |
	eg := PMExponentialDistribution scale: 10.
	arr := Array new: 10000.
	(1 to: 10000) do: [ :index | arr at: index put: eg random ].
	self
		assert: (arr average between: eg average * 0.95 and: eg average * 1.05)