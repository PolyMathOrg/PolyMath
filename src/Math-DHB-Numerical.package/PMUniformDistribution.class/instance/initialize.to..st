initialization
initialize: aNumber1 to: aNumber2
		"Private - Defines the limits of the receiver."
	aNumber1 < aNumber2
		ifFalse: [ self error: 'Illegal distribution parameters'].
	lowLimit := aNumber1.
	highLimit := aNumber2.
	^self