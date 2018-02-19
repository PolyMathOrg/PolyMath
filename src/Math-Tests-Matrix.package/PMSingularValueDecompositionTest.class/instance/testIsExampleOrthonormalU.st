tests
testIsExampleOrthonormalU
	"Verifying that matrix U in the given example is orthonormal. That is, all columns of U are unit vectors and orthogonal to each other."
	
	| m identity |
		
	m := actualU numberOfRows.
	
	identity := PMSymmetricMatrix identity: m.
	self assert: (actualU transpose * actualU) closeTo: identity