operation
> aNumber
	"Apply > operator to each element of the matrix"

	^ PMMatrix rows: (self rowsCollect: [ :each | each > aNumber ])