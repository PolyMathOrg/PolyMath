tests
testMultiply
	| a b |
	a := DhbDecimalFloatingNumber new: 0.10101.
	b := DhbDecimalFloatingNumber new: 0.2.
	self should: [(a * b) isKindOf: DhbDecimalFloatingNumber].
	self should: [(a * b) value asFloat = 0.020202].
	self should: [(b * b) value = (1/25)].
	self should: [(b * b) value asFloat = 0.04].