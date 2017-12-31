tests
testResult
	| matrix u v s ones v1 v2 |
	matrix := PMMatrix rows:
		#(#(84 -79 58 55) #(-79 84 -55 -58) #(58 -55 84 79) #(55 -58 79 84)).
	u := PMSingularValueDecomposition getLeftMatrix: matrix.
	v := PMSingularValueDecomposition getRightMatrix: matrix.
	s := PMSingularValueDecomposition getSMatrix: matrix.
	ones := PMVector ones: 4.
	v1 := u transpose * s * v * ones.
	v2 := matrix * ones.
	self assert: ((v1 at: 1) closeTo: (v2 at: 1)).
	self assert: ((v1 at: 2) closeTo: (v2 at: 2)).
	self assert: ((v1 at: 3) closeTo: (v2 at: 3)).
	self assert: ((v1 at: 4) closeTo: (v2 at: 4))