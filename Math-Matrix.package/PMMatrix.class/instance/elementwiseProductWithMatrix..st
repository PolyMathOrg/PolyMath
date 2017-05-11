double dispatching
elementwiseProductWithMatrix: aMatrix
	"Answers the elementwise product between aMatrix and the receiver as a Matrix."
	| n |
	n := 0.
	^ PMMatrix rows: ( aMatrix rowsCollect: [ :each | n := n + 1. each dot: ( self rowAt: n)])
