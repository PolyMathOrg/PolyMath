tests
testAdd
	| a b sum |
	a := PMDecimalFloatingNumber new: 0.10101.
	b := PMDecimalFloatingNumber new: 0.2.
	sum := a + b.
	self assert: (sum isKindOf: PMDecimalFloatingNumber).
	self assert: sum value equals: (b + a) value.
	self assert: (sum value isKindOf: Fraction).
	self assert: sum value asFloat equals: 0.30101