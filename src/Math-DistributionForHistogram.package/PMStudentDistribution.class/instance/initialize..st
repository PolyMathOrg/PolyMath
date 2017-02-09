initialization
initialize: anInteger

	anInteger > 0
		ifFalse: [ self error: 'Degree of freedom must be positive'].
	degreeOfFreedom := anInteger.
	self computeNorm.
	^self