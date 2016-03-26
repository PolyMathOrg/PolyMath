tests
testAdd
	| a b sum |
	a := DhbDecimalFloatingNumber new: 0.10101.
	b := DhbDecimalFloatingNumber new: 0.2.
	sum := a + b.
	self assert: (sum isKindOf: DhbDecimalFloatingNumber).
	self assert: sum value equals: (b + a) value.
	self assert: (sum value isKindOf: Fraction).
	self assert: sum value asFloat equals: 0.30101