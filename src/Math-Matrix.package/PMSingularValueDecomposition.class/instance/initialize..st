initialization
initialize: aMatrix

	| leftSymmetric rightSymmetric |
	m := aMatrix numberOfRows.
	n := aMatrix numberOfColumns.
	
	leftSymmetric := (aMatrix * aMatrix transpose) asSymmetricMatrix.
	rightSymmetric := (aMatrix transpose * aMatrix) asSymmetricMatrix.
	
	u := self getLeftMatrix: leftSymmetric.
	v := self getRightMatrix: rightSymmetric.
	s := self getSMatrix: leftSymmetric.
	
	"self determineSigns: aMatrix.
	
	u := (1 to: m) collect: [ :i |
		(signU at: i) * (u columnAt: i) ].
	
	v := (1 to: n) collect: [ :i |
		(signV at: i) * (v columnAt: i) ].
	
	u := (PMMatrix rows: u) transpose.
	v := (PMMatrix rows: v) transpose."