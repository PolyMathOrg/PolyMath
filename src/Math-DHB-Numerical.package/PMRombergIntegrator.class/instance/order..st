initialization
order: anInteger
	anInteger < 2
		ifTrue: [ self error: 'Order for Romberg integration must be larger than 1'].
	order := anInteger