tests
testConjugated
	
	| c cc |
	c := (5 - 6 i).
	cc := c conjugated.
	self assert: cc real = c real.
	self assert: cc imaginary = c imaginary negated.