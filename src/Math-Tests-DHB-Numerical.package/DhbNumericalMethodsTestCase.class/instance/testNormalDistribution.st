statistics
testNormalDistribution
	| dist |
	dist := DhbNormalDistribution new: 3.4 sigma: 1.7.
	self should: [ (dist average - 3.4) abs < 0.000000001].
	self should: [ (dist standardDeviation - 1.7) abs < 0.000000001].
	self should: [ ((dist value: 4.5) - 0.1903464693) abs < 0.000000001].
	self should: [ ((dist distributionValue: 4.5) - 0.7412031298) abs < 0.000000001].