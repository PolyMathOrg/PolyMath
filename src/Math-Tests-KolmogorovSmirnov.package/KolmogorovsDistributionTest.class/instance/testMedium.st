tests
testMedium
	| kd |
	kd := KolmogorovsDistribution exampleSize: 100.
	self assert: (kd average round: 3) equals: (0.08519 round: 3).
	self
		assert: (kd standardDeviation round: 3)
		equals: (0.025916 round: 3).
	self assert: (kd skewness round: 2) equals: (0.8561 round: 2).
	self
		assert: ((kd kurtosis round: 2) - (3.869 round: 2)) abs <= 0.0101.	"this result is slightly off"
	self assert: ((kd distributionValue: 0.0503) round: 3) equals: 0.05.
	self assert: ((kd distributionValue: 0.1339) round: 3) equals: 0.95.
	self assert: kd parameters equals: #(100)