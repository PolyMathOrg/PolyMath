tests
testRandom
	| c r |
	c := Float random + Float random i.
	r := c random.
	self should: [r isComplex ].
	self should: [ r abs  < c abs].