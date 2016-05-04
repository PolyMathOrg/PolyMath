tests
testRoundingErrors
	| a b |
	a := PMDecimalFloatingNumber new: (2 raisedTo: 64).
	b := PMDecimalFloatingNumber new: 300.
	self assert: (a + b) value equals: a value