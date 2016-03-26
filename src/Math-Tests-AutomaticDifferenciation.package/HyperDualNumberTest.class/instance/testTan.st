tests-mathematical functions
testTan
	| a |
	a := three tan.
	self assert: a value equals: 3 tan.
	self assert: (a eps equalsTo: 3 tan squared + 1).
	self assert: (a eps equalsTo: a eps2).
	self assert: (a eps1eps2 equalsTo: -0.2908860399427)