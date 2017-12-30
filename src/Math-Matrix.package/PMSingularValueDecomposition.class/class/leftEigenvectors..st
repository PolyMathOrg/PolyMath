transformation
leftEigenvectors: aMatrix
	"comment stating purpose of message"

	| symmetricMatrix |
	symmetricMatrix := self matrixForLeftSide: aMatrix.
	symmetricMatrix := PMJacobiTransformation  matrix: symmetricMatrix.
	symmetricMatrix evaluate.
	^ symmetricMatrix transform columnsCollect: [ :each | each].