operation
eigen
	"Computes all eigenvalues and eigenvectors for symmetric matrix using Jacobi transformation
	Usage:
	matrix eigen values.
	matrix eigen vectors."

	^ PMJacobiTransformationHelper matrix: self.