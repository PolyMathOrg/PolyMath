testing-trigonometry
testArcCosDomainError
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arcCos] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arcCos] raise: DomainError.