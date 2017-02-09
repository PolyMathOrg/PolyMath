operation
transpose
	"Answer a new matrix, transpose of the receiver."
	^ self class rows: ( self columnsCollect: [ :each | each])