tests
testConjugated
	| c cc |
	c := 5 - 6 i.
	cc := c conjugated.
	self assert: cc real equals: c real.
	self assert: cc imaginary equals: c imaginary negated