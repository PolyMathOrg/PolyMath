actions
getLeftMatrix: aMatrix
	"comment stating purpose of message"

	| eigenvectors|
	eigenvectors := self leftEigenvectors: aMatrix.
	^PMMatrix rows: eigenvectors.