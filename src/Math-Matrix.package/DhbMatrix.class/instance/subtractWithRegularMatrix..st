double dispatching
subtractWithRegularMatrix: aMatrix
	"Answers the difference between aMatrix and the receiver as a Matrix."
	| n |
	n := 0.
	^ DhbMatrix rows: ( aMatrix rowsCollect: [ :each | n := n + 1. each - ( self rowAt: n)])