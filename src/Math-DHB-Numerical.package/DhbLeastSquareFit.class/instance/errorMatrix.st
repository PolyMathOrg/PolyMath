information
errorMatrix
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 14/4/99 "
	errorMatrix inverseMatrixComponents 
		ifNil: [ SingularMatrixError new signal:'singular Errormatrix' ] 
		ifNotNilDo: [ :i| ^DhbSymmetricMatrix rows: i ].
