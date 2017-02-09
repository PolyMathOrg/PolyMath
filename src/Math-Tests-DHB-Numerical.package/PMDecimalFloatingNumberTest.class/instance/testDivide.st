tests
testDivide
	| a b |
	a := PMDecimalFloatingNumber new: 0.10101.
	b := PMDecimalFloatingNumber new: 0.2.
	self assert: (a / b isKindOf: PMDecimalFloatingNumber).
	self assert: (a / b) value asFloat equals: 0.50505.
	self assert: (b / b) value equals: 1