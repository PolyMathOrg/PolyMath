tests
testNumberOfDifferentResultsAt
	self assert: (a numberOfDifferentResultsAt: 'Aaa') equals: 2.
	self assert: (a numberOfDifferentResultsAt: 'Bbb') equals: 2.
	self assert: (a numberOfDifferentResultsAt: 'Ccc') equals: 3.
	self assert: (a numberOfDifferentResultsAt: 'Ddd') equals: 1.
	self assert: (a numberOfDifferentResultsAt: 'Eee') equals: 2