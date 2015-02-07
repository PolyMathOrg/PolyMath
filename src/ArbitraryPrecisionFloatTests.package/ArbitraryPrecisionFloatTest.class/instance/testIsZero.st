testing-compare
testIsZero
	self assert: zero isZero.
	self deny: one isZero.
	self deny: minusTwo isZero.