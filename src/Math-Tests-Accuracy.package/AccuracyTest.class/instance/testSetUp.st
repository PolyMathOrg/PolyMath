tests
testSetUp
	self assert: a count = 0.
	a performCheck: 'Fff'.
	self assert: a count = (4/5).
	a iterations:3.
	a performCheck: 'Ccc'.
	self assert: a count = (16/5).