tests
testNew
	| c |
	c := Complex new.
	self should: [ c real = 0].
	self should: [c imaginary = 0].