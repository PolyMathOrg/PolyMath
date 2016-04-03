initialization
initialize: aNumber
	"Private - Set the scale parameter of the receiver to aNumber."

	aNumber > 0
		ifFalse: [ self error: 'Illegal distribution parameters' ].
	beta := aNumber.
	^ self