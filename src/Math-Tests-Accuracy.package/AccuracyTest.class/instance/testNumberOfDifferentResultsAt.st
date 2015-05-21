tests
testNumberOfDifferentResultsAt
	self assert: (a numberOfDifferentResultsAt: 'Aaa') =2.
	self assert: (a numberOfDifferentResultsAt: 'Bbb') =2.
	self assert: (a numberOfDifferentResultsAt: 'Ccc') =3.
	self assert: (a numberOfDifferentResultsAt: 'Ddd') =1.
	self assert: (a numberOfDifferentResultsAt: 'Eee') =2.
