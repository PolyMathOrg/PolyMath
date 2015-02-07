testing-trigonometry
testArcSinDomainError
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arcSin] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arcSin] raise: DomainError.