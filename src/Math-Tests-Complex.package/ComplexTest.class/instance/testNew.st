tests
testNew
	| c |
	c := Complex new.
	self assert: c real equals: 0.
	self assert: c imaginary equals: 0