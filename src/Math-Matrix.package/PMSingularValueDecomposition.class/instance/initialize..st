initialization
initialize: aMatrix

	| symU symV eigenU eigenV diag |
	m := aMatrix numberOfRows.
	n := aMatrix numberOfColumns.
	
	symU := aMatrix * aMatrix transpose.
	symV := aMatrix transpose * aMatrix.
	
	"Expensive computation"
	eigenU := symU eigen.
	eigenV := symV eigen.
	
	u := (PMMatrix rows: eigenU vectors) transpose.
	v := (PMMatrix rows: eigenV vectors) transpose.
	
	m < n
		ifTrue: [ diag := eigenU values ]
		ifFalse: [ diag := eigenV values ].
		
	s := PMMatrix rows: m columns: n random: 0.
	s setDiagonal: diag sqrt.