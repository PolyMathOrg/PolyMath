testing-functions
testSqrtDomainError
	self should: [(-2 asArbitraryPrecisionFloatNumBits: 24) sqrt] raise: DomainError.