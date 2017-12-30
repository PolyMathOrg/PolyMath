actions
getDiagonal: aMatrix
	"comment stating purpose of message"

	| eigenvaluesLeft eigenvaluesRight |
	eigenvaluesLeft := self  leftEigenvalues: aMatrix.
	eigenvaluesRight := self rightEigenvalues: aMatrix.
	eigenvaluesLeft size < eigenvaluesRight size 
		ifTrue: [^(eigenvaluesLeft sqrt sort reverse) asPMVector ]
		ifFalse: [^(eigenvaluesRight sqrt sort reverse) asPMVector ]
	