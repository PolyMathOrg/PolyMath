tests
testIsOrthonormalV
	"Verifying that matrix U is orthonormal. That is, all columns of U are unit vectors and orthogonal to each other."

	| v n identity |
		
	v := matrix decompose rightSingularForm.
	n := v numberOfRows.
	
	identity := PMSymmetricMatrix identity: n.
	self assert: v transpose * v closeTo: identity