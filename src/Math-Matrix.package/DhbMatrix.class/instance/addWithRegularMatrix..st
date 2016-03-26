double dispatching
addWithRegularMatrix: aMatrix
	"Answers the sum of the receiver with aMatrix as a DhbMatrix."
	| n |
	n := 0.
	^ DhbMatrix rows: ( self rowsCollect: [ :each | n := n + 1. each + ( aMatrix rowAt: n)])