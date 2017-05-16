as yet unclassified
getSMatrix: aMatrix
	"Return mxn matrix with singular values on main diagonal"

	| matrix input |
	matrix := PMMatrix rows: ( aMatrix numberOfRows) columns: ( aMatrix numberOfColumns)  random: 0.
	input := self getDiagonal: aMatrix.
	^ matrix setDiagonal: input 