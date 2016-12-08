testing
isAnExactFloat
	^self exponent <= Float emax
		and: [Float emin - Float precision < self exponent
		and: [nBits <= Float precision or: [mantissa isAnExactFloat]]]