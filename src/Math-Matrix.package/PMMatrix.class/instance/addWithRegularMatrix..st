double dispatching
addWithRegularMatrix: aMatrix
	"Answers the sum of the receiver with aMatrix as a PMMatrix."
	| n |
	n := 0.
	
	(self numberOfRows = aMatrix numberOfRows) &
	(self numberOfColumns = aMatrix numberOfColumns)
		ifFalse: [ SizeMismatch signal ].
	
	^ PMMatrix rows: ( self rowsCollect: [ :each | n := n + 1. each + ( aMatrix rowAt: n)])