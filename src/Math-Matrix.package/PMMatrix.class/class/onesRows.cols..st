instance creation
onesRows: rows cols: columns
	"Creates MxN matrix of ones"

	| a b |
	a := (1 to: rows) collect: [ :row | b := PMVector ones: columns ].
	^ self rows: a