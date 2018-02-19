tests
testReconstruction

	| svd u v s reconstructed |
		
	svd := matrix decompose.
	u := svd leftSingularForm.
	v := svd rightSingularForm.
	s := svd sForm.
	
	reconstructed := u * s * v transpose.
	self assert: reconstructed closeTo: matrix