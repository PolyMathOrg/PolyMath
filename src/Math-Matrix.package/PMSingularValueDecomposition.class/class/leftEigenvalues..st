transformation
leftEigenvalues: aMatrix
	"comment stating purpose of message"

	| eigenvaluesLeft |
	eigenvaluesLeft := self matrixForLeftSide: aMatrix.
	eigenvaluesLeft := PMJacobiTransformation matrix: eigenvaluesLeft.
	^ eigenvaluesLeft evaluate

	