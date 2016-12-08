testing-coercing
testCoercingMultiply
	(Array with: 1/2 with: 0.5e0 with: 0.5s1) do: [:heteroHalf |
		self assert: two * heteroHalf = one.
		self assert: (two * heteroHalf) class = half class.
		self assert: (two * heteroHalf) numBits = half numBits.
		self assert: heteroHalf * two = one.
		self assert: (heteroHalf * two) class = half class.
		self assert: (heteroHalf * two) numBits = half numBits].

	self assert: minusOne * 2 = minusTwo.
	self assert: (minusOne * 2) class = minusOne class.
	self assert: (minusOne * 2) numBits = minusOne numBits.
	self assert: 2 * one = two.
	self assert: (2 * one) class = one class.
	self assert: (2 * one) numBits = one numBits.