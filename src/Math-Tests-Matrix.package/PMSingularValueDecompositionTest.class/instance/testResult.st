tests
testResult

	| matrix u v s reconstructed |
	
	matrix := PMMatrix rows: #(
		(84 -79 58 55)
		(-79 84 -55 -58)
		(58 -55 84 79)
		(55 -58 79 84)).
		
	u := PMSingularValueDecomposition getLeftMatrix: matrix.
	v := PMSingularValueDecomposition getRightMatrix: matrix.
	s := PMSingularValueDecomposition getSMatrix: matrix.
	
	reconstructed := u transpose * s * v.
	self assert: reconstructed closeTo: matrix