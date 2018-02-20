*Math-Core
addWithRegularMatrix: aMatrix
	"Adds itself to every row of the matrix"
	^ PMMatrix rows: (aMatrix rowsCollect: [ :row | row + self ])