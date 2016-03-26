tests
testNumberAsComplex
	| minusOne |
	minusOne := -1 asComplex.
	self assert: minusOne real equals: -1.
	self assert: minusOne imaginary equals: 0.
	self assert: minusOne conjugated equals: minusOne.
	self assert: minusOne sqrt equals: 1 i