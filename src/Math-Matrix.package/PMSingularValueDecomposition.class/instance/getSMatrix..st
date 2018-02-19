private
getSMatrix: aSymmetricMatrix
	"Return mxn matrix with singular values on main diagonal"

	| matrix eigenvalues diagonal |
	matrix := PMMatrix rows: m columns: n random: 0.
	
	eigenvalues := aSymmetricMatrix eigenvalues.
	diagonal := (eigenvalues collect: [ :x | x sqrt ]),
		(PMVector zeros: ((m min: n) - eigenvalues size)).

	^ matrix setDiagonal: diagonal