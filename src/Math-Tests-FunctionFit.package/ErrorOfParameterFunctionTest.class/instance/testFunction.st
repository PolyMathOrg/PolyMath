tests
testFunction
	self assert: (f function cull: 1 cull: 2 cull: 3) equals: 1 / 2.
	self assert: f parameterSize equals: 2