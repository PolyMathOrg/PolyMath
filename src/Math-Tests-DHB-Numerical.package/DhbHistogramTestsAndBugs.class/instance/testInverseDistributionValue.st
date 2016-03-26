tests
testInverseDistributionValue
	self assert: (h inverseDistributionValue: 1) equals: h maximum.
	self assert: (h inverseDistributionValue: 0) equals: h minimum