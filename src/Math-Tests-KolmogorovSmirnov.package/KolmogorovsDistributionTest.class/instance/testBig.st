tests
testBig
	| kd |
	kd := PMKolmogorovsDistribution exampleSize: 1000.
	self assert: (kd average round: 4) equals: (0.02730 round: 4).
	self assert: (kd standardDeviation round: 5) - (0.008229 round: 5) < 2.01e-5.
	self assert: (kd skewness round: 2) equals: (0.8616 round: 2).
	self assert: (kd kurtosis round: 2) equals: (3.884 round: 2).
	kd := PMKolmogorovsDistribution exampleSize: 500.
	self assert: ((kd distributionValue: 0.0229) round: 2) equals: 0.05.
	self assert: ((kd distributionValue: 0.0605) round: 3) equals: 0.95