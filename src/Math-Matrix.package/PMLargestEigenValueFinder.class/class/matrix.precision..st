creation
matrix: aMatrix precision: aNumber
		"Create a new instance of the receiver for a given matrix and desired precision.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^( self new) initialize: aMatrix; desiredPrecision: aNumber; yourself