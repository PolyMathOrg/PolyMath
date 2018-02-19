tests
testIsExampleOrthonormalV
	"Verifying that matrix V in the given example is orthonormal. That is, all columns of V are unit vectors and orthogonal to each other."
	
	| n identity |
		
	n := actualV numberOfRows.
	
	identity := PMSymmetricMatrix identity: n.
	self assert: (actualV transpose * actualV) closeTo: identity