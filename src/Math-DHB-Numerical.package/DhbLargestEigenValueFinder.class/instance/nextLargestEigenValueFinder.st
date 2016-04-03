creation
nextLargestEigenValueFinder
	"Return an eigen value finder for the same eigen values of the receiver except the one found."

	| norm |
	norm := 1 / (eigenvector * transposeEigenvector).
	^self class 
		matrix: matrix * ((DhbSymmetricMatrix identity: eigenvector size) 
						- (eigenvector * norm tensorProduct: transposeEigenvector))
		precision: desiredPrecision