statistics
testGammaDistribution
	| dist |
	dist := PMGammaDistribution shape: 3.4 scale: 1.7.
	self assert: (dist average - (3.4 * 1.7)) abs < 0.000000001.
	self
		assert: (dist standardDeviation - (3.4 sqrt * 1.7)) abs < 0.000000001.
	self assert: ((dist value: 4.5) - 0.1446067652) abs < 0.000000001.
	self
		assert: ((dist distributionValue: 4.5) - 0.3982869736) abs < 0.000000001