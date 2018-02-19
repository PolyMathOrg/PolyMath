private
getRightMatrix: aSymmetricMatrix
	"comment stating purpose of message"

	| eigenvectors|
	eigenvectors := aSymmetricMatrix eigenvectors.
	^ (PMMatrix rows: eigenvectors) transpose.