initialization
desiredPrecision: aNumber
	"Defines the desired precision for the result."
	aNumber > 0
		ifFalse: [ ^self error: 'Illegal precision: ', aNumber printString].
	desiredPrecision := aNumber.