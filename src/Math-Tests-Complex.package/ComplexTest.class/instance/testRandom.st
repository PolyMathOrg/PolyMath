tests
testRandom
	| c r |
	c := Float random + Float random i.
	r := c random.
	self assert: r isComplexNumber.
	self assert: r abs < c abs