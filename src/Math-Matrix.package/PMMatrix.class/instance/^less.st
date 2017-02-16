operation
< aNumber
	"Apply < operator to each element of the matrix"
	| n |
	n := 0.
	^ PMMatrix rows: ( self rowsCollect: [ :each | n := n + 1. each < aNumber])
	