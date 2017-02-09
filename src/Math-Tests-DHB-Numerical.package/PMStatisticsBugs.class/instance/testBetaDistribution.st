tests
testBetaDistribution
	| d |
	d := PMBetaDistribution shape: 0.9 shape: 0.9.
	self assert: (d distributionValue: 1.0 successor) equals: 1.
	self assert: (d distributionValue: 4) equals: 1.
	self assert: (d distributionValue: 0.0 predecessor) equals: 0.
	self assert: (d distributionValue: -2) equals: 0