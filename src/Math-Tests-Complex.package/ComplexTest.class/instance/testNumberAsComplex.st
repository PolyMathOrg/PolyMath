tests
testNumberAsComplex
	| minusOne |
	minusOne := -1 asComplex.
	self assert: minusOne real = -1.
	self assert: minusOne imaginary = 0.
	self assert: minusOne conjugated = minusOne.
	self assert: minusOne sqrt = 1 i