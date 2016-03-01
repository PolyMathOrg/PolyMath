information
value: aNumber
	"Answer the value of the polynomial for the specified variable value."
	^coefficients inject: 0 into: [ :sum :each | sum * aNumber + each]