*Math-Matrix
eigenvalues
	"Computes all eigenvalues for symmetric matrix using Jacobi transformation"

	| jacobi |

	jacobi := PMJacobiTransformation matrix: self.
	^ jacobi evaluate.