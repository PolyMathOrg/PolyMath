initialization
initialize: aSymmetricMatrix

	| jacobi |
	jacobi := PMJacobiTransformation matrix: aSymmetricMatrix.
	eigenvalues := jacobi evaluate.
	eigenvectors := jacobi transform columnsCollect: [ :each | each].