initialization
initialize: aNumber1 from: aNumber2 to: aNumber3
		"Private - Defines the parameters of the receiver."
	( aNumber2 < aNumber3 and: [ aNumber1 between: aNumber2 and: aNumber3])
		ifFalse: [ self error: 'Illegal distribution parameters'].
	peak := aNumber1.
	lowLimit := aNumber2.
	highLimit := aNumber3