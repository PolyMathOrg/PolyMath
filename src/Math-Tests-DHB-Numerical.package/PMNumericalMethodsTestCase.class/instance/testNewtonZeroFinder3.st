iterative algorithms
testNewtonZeroFinder3
	"Test Newton's method for linear function
	
	   F(x) = x + 1 = 0, x = 5.
	
	   F'(x) = 1
	
	This should converge in two iterations: the first iteration produces large step,
	but the second iteration step is zero => convergence"
	| zeroFinder result |
	zeroFinder := PMNewtonZeroFinder function: [ :x | x + 1 ] derivative: [ :x | 1  ].
	zeroFinder initialValue: 5.0.
	result := zeroFinder evaluate.
	self assert: zeroFinder hasConverged.
	self assert: (result + 1) abs <= zeroFinder precision.
	self assert: zeroFinder iterations = 2.