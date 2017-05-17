iterators
collect: aBlock
	"Applies aBlock elementwise to each cell of the matrix."
	^ self class rows: (rows collect: [ :r | r collect: aBlock ])