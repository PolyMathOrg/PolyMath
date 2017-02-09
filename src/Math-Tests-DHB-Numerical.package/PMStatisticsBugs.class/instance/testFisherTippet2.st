tests
testFisherTippet2
	| d |
	d := PMFisherTippettDistribution shape: -3 scale: 0.7.
	self assert: (d distributionValue: Float fmax) equals: 1.	"old version could do this, but new version also because #exp uses a primitive who takes care of overflow"
	self assert: (d distributionValue: Float fmax negated) equals: 0.
	self assert: (d distributionValue: -100) equals: 0.	"bug is here"
	self assert: (d distributionValue: 100) equals: 1.
	self assert: (d distributionValue: -3) equals: -1 exp