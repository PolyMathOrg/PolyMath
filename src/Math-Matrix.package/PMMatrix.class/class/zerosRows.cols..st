instance creation
zerosRows: rows cols: columns
	"Creates MxN matrix of zeros"

	| a b |
	a := (1 to: rows) collect: [ :row | b := PMVector zeros: columns ].
	^ self rows: a