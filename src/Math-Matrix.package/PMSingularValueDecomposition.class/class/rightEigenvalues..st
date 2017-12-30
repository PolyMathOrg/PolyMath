transformation
rightEigenvalues: aMatrix
	"comment stating purpose of message"

	| eigenvaluesRight |
	eigenvaluesRight := self matrixForRightSide: aMatrix.
	eigenvaluesRight := PMJacobiTransformation matrix: eigenvaluesRight.
	^ eigenvaluesRight evaluate
	