tests
testSqrt
	| a aSqrt |
	a := PMDecimalFloatingNumber new: 0.01.
	aSqrt := a sqrt.
	self assert: aSqrt value asFloat equals: a value asFloat sqrt.
	self assert: aSqrt value equals: 1 / 10