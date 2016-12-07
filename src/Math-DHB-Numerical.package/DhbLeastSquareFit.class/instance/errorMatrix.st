information
errorMatrix
	errorMatrix inverseMatrixComponents
		ifNil: [ SingularMatrixError new signal: 'singular Errormatrix' ]
		ifNotNil: [ :i | ^ DhbSymmetricMatrix rows: i ]