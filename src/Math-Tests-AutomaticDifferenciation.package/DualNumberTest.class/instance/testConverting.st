tests
testConverting
	| a |
	self assert: zeroc asInteger == 0.
	self assert: three asInteger == 3.
	self assert: onec asFloat isFloat.
	self deny: onec isFloat.
	self assert: onec asFloat equals: 1.
	a := three negated asFloat.
	self assert: a isFloat.
	self assert: a equals: -3.
	self assert: (PMDualNumber value: -3.7 eps: 2) asInteger == -3