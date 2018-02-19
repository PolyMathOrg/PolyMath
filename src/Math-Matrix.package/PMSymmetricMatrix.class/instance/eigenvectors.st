*Math-Matrix
eigenvectors
	"Computes all eigenvectors for symmetric matrix using Jacobi transformation"

	| jacobi |

	jacobi := PMJacobiTransformation matrix: self.
	jacobi evaluate.
	^ jacobi transform columnsCollect: [ :each | each].