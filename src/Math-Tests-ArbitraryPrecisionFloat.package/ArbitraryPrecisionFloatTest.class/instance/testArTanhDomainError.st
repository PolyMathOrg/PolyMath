testing-hyperbolic
testArTanhDomainError
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arTanh] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arTanh] raise: DomainError.