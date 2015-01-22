tests
testCosh
	| c c2 |
	c := (2 + 0 i).
	self assert: (c cosh real closeTo: c real cosh).
	self assert: (c cosh imaginary closeTo: 0).
	c := (2 + 3 i).
	c2 := c exp + c negated exp / 2.
	self assert: (c cosh real closeTo: c2 real).
	self assert: (c cosh imaginary closeTo: c2 imaginary).
	c2 := c i cos.
	self assert: (c cosh real closeTo: c2 real).
	self assert: (c cosh imaginary closeTo: c2 imaginary).