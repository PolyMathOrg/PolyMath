iterative algorithms
testNewtonZeroFinder2
	"Test Newton's method for
	
	   atan x = 0, x = 5.
	
	   atan' x = 1 / (1+x^2)
	
	This case requires line search to decrease the initial step."
	| zeroFinder result |
	zeroFinder := PMNewtonZeroFinder
		function: [ :x | x arcTan ]
		derivative: [ :x | 1 / (1 + x squared) ].
	zeroFinder initialValue: 5.0.
	result := zeroFinder evaluate.
	self assert: zeroFinder hasConverged.
	self assert: result abs < zeroFinder precision