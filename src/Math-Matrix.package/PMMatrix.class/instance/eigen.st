operation
eigen
	"Computes all eigenvalues and eigenvectors of a matrix.
	Usage:
	matrix eigen values.
	matrix eigen vectors."

	self isSymmetric
		ifTrue: [ ^ self asSymmetricMatrix eigen ]
		ifFalse: [ self error: 'Eigenvalues and eigenvectors of non-symmetric matrix are currently not supported' ]