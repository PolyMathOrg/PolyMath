tests
testDisplay
	| a |
	a := DhbDecimalFloatingNumber new: 1.
	self should: [(a printString subStrings: 'E') last asInteger  = a class digits negated].
	
	a := DhbDecimalFloatingNumber new: 0.1.
	self should: [(a printString subStrings: 'E') last asInteger  = (a class digits negated - 1)].