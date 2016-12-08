testing-coercing
testCoercingDivide
	(Array with: 1/2 with: 0.5e0 with: 0.5s1) do: [:heteroHalf |
		self assert: one / heteroHalf = two.
		self assert: (one / heteroHalf) class = one class.
		self assert: (one / heteroHalf) numBits = one numBits.
		self assert: heteroHalf / one = half.
		self assert: (heteroHalf / one) class = one class.
		self assert: (heteroHalf / one) numBits = one numBits].

	self assert: one / 2 = half.
	self assert: (one / 2) class = one class.
	self assert: (one / 2) numBits = one numBits.
	self assert: -2 / two = minusOne.
	self assert: (-2 / two) class = two class.
	self assert: (-2 / two) numBits = two numBits.