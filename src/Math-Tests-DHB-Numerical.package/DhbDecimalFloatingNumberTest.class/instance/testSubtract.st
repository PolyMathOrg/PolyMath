tests
testSubtract
	| a b difference |
	a := DhbDecimalFloatingNumber new: 0.1.
	b := DhbDecimalFloatingNumber new: 0.2.
	difference := b - a.
	self should: [difference isKindOf: DhbDecimalFloatingNumber].
	
	" this errors raised by ln (domain is x > 0)"
	self should: [difference value ~= (a - b) value] raise: Error.
	self should: [difference value = (a - b) value negated] raise: Error.
	
	self should: [difference value isKindOf: Fraction ].
	self should: [difference value asFloat = 0.1].