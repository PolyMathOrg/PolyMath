tests
testNumberOfDifferentParametersAt
	self assert: (a numberOfDifferentParametersAt: 'Aaa') equals: 2.
	self assert: (a numberOfDifferentParametersAt: 'Ccc') equals: 2.
	self assert: (a numberOfDifferentParametersAt: 'Ddd') equals: 1.
	self assert: (a numberOfDifferentParametersAt: 'Fff') equals: 1