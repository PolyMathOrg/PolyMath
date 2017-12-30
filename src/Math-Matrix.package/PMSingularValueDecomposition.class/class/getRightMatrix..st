actions
getRightMatrix: aMatrix
	"comment stating purpose of message"

	| eigenvectors|
	eigenvectors := self rightEigenvectors: aMatrix.
	^PMMatrix rows: eigenvectors.