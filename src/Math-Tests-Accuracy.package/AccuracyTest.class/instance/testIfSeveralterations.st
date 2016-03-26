tests
testIfSeveralterations
	a iterations: 2.
	self assert: (a ifSeveralterations: [ 1 ]) equals: 1.
	a iterations: 1.
	self assert: (a ifSeveralterations: [ 1 ]) equals: a