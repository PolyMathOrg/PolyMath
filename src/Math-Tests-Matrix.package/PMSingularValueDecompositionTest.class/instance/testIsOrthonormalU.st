tests
testIsOrthonormalU
	"Verifying that matrix U is orthonormal. That is, all columns of U are unit vectors and orthogonal to each other."

	| u m identity |
		
	u := matrix decompose leftSingularForm.
	m := u numberOfRows.
	
	identity := PMSymmetricMatrix identity: m.
	self assert: u transpose * u closeTo: identity