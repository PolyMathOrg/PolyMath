transformation
rightEigenvectors: aMatrix
	"comment stating purpose of message"

	| symmetricMatrix |
	symmetricMatrix := self matrixForRightSide: aMatrix.
	symmetricMatrix := PMJacobiTransformation  matrix: symmetricMatrix.
	symmetricMatrix evaluate.
	^ symmetricMatrix transform columnsCollect: [ :each | each].