tests
testDivide
	| a b |
	a := DhbDecimalFloatingNumber new: 0.10101.
	b := DhbDecimalFloatingNumber new: 0.2.
	self assert: (a / b isKindOf: DhbDecimalFloatingNumber).
	self assert: (a / b) value asFloat equals: 0.50505.
	self assert: (b / b) value equals: 1