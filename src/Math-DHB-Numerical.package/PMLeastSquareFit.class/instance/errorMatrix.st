information
errorMatrix
	errorMatrix inverseMatrixComponents
		ifNil: [ PMSingularMatrixError new signal: 'singular Errormatrix' ]
		ifNotNil: [ :i | ^ PMSymmetricMatrix rows: i ]