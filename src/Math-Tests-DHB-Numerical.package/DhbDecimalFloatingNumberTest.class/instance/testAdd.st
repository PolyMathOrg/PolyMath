tests
testAdd
	| a b sum |
	a := DhbDecimalFloatingNumber new: 0.10101.
	b := DhbDecimalFloatingNumber new: 0.2.
	sum := a + b.
	self should: [sum isKindOf: DhbDecimalFloatingNumber].
	self should: [sum value = (b + a) value].
	self should: [sum value isKindOf: Fraction ].
	self should: [sum value asFloat = 0.30101].