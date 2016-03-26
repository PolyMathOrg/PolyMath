tests
testRoundingErrors
	| a b |
	a := DhbDecimalFloatingNumber new: (2 raisedTo: 64).
	b := DhbDecimalFloatingNumber new: 300.
	self assert: (a + b) value equals: a value