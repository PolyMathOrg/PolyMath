operation
evaluateIteration
	"Iterate the product of the matrix of the eigen vector and the transpose.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

	| oldEigenvalue |
	oldEigenvalue := result.
	transposeEigenvector := transposeEigenvector * matrix.
	transposeEigenvector := transposeEigenvector 
				* (1 / (transposeEigenvector at: 1)).
	eigenvector := matrix * eigenvector.
	result := eigenvector at: 1.
	eigenvector := eigenvector * (1 / result).
	^oldEigenvalue isNil 
		ifTrue: [2 * desiredPrecision]
		ifFalse: [(result - oldEigenvalue) abs]