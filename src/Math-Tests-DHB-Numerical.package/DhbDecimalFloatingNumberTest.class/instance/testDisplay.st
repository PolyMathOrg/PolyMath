tests
testDisplay
	| a |
	a := DhbDecimalFloatingNumber new: 1.
	self
		assert: (a printString substrings: 'E') last asInteger
		equals: a class digits negated.
	a := DhbDecimalFloatingNumber new: 0.1.
	self
		assert: (a printString substrings: 'E') last asInteger
		equals: a class digits negated - 1