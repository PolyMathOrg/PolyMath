linear algebra
testMatrixTrace
	"Code Example 8.1"

	| a |
	a := PMMatrix rows: #((1 2 3)(4 5 6)(7 8 9)).
	self assert: (a trace) equals: 15.