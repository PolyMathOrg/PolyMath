creation
matrix: aMatrix precision: aNumber
		"Create a new instance of the receiver for a given matrix and desired precision."
	^( self new) initialize: aMatrix; desiredPrecision: aNumber; yourself