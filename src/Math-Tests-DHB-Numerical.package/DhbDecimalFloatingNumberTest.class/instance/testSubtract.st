tests
testSubtract
	| a b difference |
	a := DhbDecimalFloatingNumber new: 0.1.
	b := DhbDecimalFloatingNumber new: 0.2.
	difference := b - a.
	self assert: (difference isKindOf: DhbDecimalFloatingNumber).

	" this errors raised by ln (domain is x > 0)"
	self should: [ difference value ~= (a - b) value ] raise: Error.
	self
		should: [ difference value = (a - b) value negated ]
		raise: Error.
	self assert: (difference value isKindOf: Fraction).
	self assert: difference value asFloat equals: 0.1