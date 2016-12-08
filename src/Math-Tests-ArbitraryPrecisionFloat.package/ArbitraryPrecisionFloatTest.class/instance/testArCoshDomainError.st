testing-hyperbolic
testArCoshDomainError
	self should: [(1/2 asArbitraryPrecisionFloatNumBits: 24) arCosh] raise: DomainError.