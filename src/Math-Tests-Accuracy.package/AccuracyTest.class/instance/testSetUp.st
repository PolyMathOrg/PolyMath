tests
testSetUp
	self assert: a count equals: 0.
	a performCheck: 'Fff'.
	self assert: a count equals: 4 / 5.
	a iterations: 3.
	a performCheck: 'Ccc'.
	self assert: a count equals: 16 / 5