tests
testDisplay
	| a |
	a := PMDecimalFloatingNumber new: 1.
	self
		assert: (a printString substrings: 'E') last asInteger
		equals: a class digits negated.
	a := PMDecimalFloatingNumber new: 0.1.
	self
		assert: (a printString substrings: 'E') last asInteger
		equals: a class digits negated - 1