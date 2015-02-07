testing-coercing
testCoercingSubtract
	(Array with: 1/2 with: 0.5e0 with: 0.5s1) do: [:heteroHalf |
		self assert: half - heteroHalf = zero.
		self assert: (half - heteroHalf) class = half class.
		self assert: (half - heteroHalf) numBits = half numBits.
		self assert: heteroHalf - half = zero.
		self assert: (heteroHalf - half) class = half class.
		self assert: (heteroHalf - half) numBits = half numBits].

	self assert: one - 1 = zero.
	self assert: (one - 1) class = minusOne class.
	self assert: (one - 1) numBits = minusOne numBits.
	self assert: -2 - minusTwo = zero.
	self assert: (-2 - minusTwo) class = minusTwo class.
	self assert: (-2 - minusTwo) numBits = minusTwo numBits.