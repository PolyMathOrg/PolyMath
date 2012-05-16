statistics
testGammaDistribution
	| dist |
	dist := DhbGammaDistribution shape: 3.4 scale: 1.7.
	self should: [ (dist average - (3.4 * 1.7)) abs < 0.000000001].
	self should: [ (dist standardDeviation - (3.4 sqrt *1.7)) abs < 0.000000001].
	self should: [ ((dist value: 4.5) - 0.1446067652) abs < 0.000000001].
	self should: [ ((dist distributionValue: 4.5) - 0.3982869736) abs < 0.000000001].