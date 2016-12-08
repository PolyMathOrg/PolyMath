testing-compare
testEqual
	self assert: zero = zero.
	self assert: one = one.
	self assert: one = one copy.
	self assert: one = (one asArbitraryPrecisionFloatNumBits: one numBits * 2).

	self deny: zero = one.
	self deny: minusOne = one.

	self assert: zero = 0.
	self assert: 0 = zero.
	self assert: zero = 0.0.
	self assert: 0.0 = zero.

	self deny: two = (1/2).
	self deny: (1/2) = two.
	self deny: zero = 1.0.
	self deny: 0.0 = one.

	self deny: one = nil.
	self deny: nil = one.