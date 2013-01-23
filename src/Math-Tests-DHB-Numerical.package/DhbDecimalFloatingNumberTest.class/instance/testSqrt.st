tests
testSqrt
	| a  aSqrt |
	a := DhbDecimalFloatingNumber new: 0.01.
	aSqrt := a sqrt.
	self should: [aSqrt value asFloat = a value asFloat sqrt].
	self should: [aSqrt value = (1/10)].