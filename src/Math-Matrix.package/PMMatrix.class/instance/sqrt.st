operation
sqrt
	"Apply sqrt to each element of a matrix"
	| n |
	n := 0.
	^ PMMatrix rows: ( self rowsCollect: [ :each | n := n + 1. each sqrt])