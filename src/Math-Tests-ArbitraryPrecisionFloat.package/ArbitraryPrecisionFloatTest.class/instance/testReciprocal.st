testing-arithmetic
testReciprocal
	| b |
	b := 1 << (Float precision - 1).
	1 to: 10000 do: [:i |
		| a |
		a := i asArbitraryPrecisionFloatNumBits: Float precision.
		self assert: a reciprocal = i asFloat reciprocal.
		self assert: (a+b) reciprocal = (i+b) asFloat reciprocal.
		self assert: a negated reciprocal = i asFloat negated reciprocal.]