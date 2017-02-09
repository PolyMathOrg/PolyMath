statistics
testNormalDistribution
	| dist |
	dist := PMNormalDistribution new: 3.4 sigma: 1.7.
	self assert: (dist average - 3.4) abs < 0.000000001.
	self assert: (dist standardDeviation - 1.7) abs < 0.000000001.
	self assert: ((dist value: 4.5) - 0.1903464693) abs < 0.000000001.
	self
		assert: ((dist distributionValue: 4.5) - 0.7412031298) abs < 0.000000001