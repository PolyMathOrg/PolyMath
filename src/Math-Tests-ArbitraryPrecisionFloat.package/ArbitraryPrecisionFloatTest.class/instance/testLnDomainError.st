testing-functions
testLnDomainError
	self should: [(-2 asArbitraryPrecisionFloatNumBits: 24) ln] raise: DomainError.