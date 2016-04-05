information
errorMatrix
	errorMatrix inverseMatrixComponents 
		ifNil: [ SingularMatrixError new signal:'singular Errormatrix' ] 
		ifNotNilDo: [ :i| ^DhbSymmetricMatrix rows: i ]
