initialization
desiredPrecision: aNumber
		"Defines the desired precision for the result.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "
	aNumber > 0
		ifFalse: [ ^self error: 'Illegal precision: ', aNumber printString].
	desiredPrecision := aNumber.