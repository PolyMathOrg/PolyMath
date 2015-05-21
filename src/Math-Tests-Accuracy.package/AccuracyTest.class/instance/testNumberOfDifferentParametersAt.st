tests
testNumberOfDifferentParametersAt
	self assert: (a numberOfDifferentParametersAt: 'Aaa') =2.
	self assert: (a numberOfDifferentParametersAt: 'Ccc') =2.
	self assert: (a numberOfDifferentParametersAt: 'Ddd') =1.
	self assert: (a numberOfDifferentParametersAt: 'Fff') =1.
