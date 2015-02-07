testing-arithmetic
testRaisedToPositiveInteger
	| n |
	n := 11.
	1 to: 1<<n-1 do: [:i |
		self assert: ((i asArbitraryPrecisionFloatNumBits: n) raisedToInteger: 49)
			equals: ((i raisedToInteger: 49) asArbitraryPrecisionFloatNumBits: n) ].