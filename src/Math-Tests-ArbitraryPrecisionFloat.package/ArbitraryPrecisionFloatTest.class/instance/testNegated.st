testing-arithmetic
testNegated
	self assert: zero negated = zero.
	self assert: one negated = minusOne.
	self assert: minusTwo negated = two.
	self assert: huge negated negated = huge.
