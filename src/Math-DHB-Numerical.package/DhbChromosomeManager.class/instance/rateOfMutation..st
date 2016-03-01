initialization
rateOfMutation: aNumber 

	(aNumber between: 0 and: 1) 
		ifFalse: [self error: 'Illegal rate of mutation'].
	rateOfMutation := aNumber