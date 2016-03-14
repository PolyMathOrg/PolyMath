initialization
rateOfCrossover: aNumber 

	(aNumber between: 0 and: 1) 
		ifFalse: [self error: 'Illegal rate of cross-over'].
	rateOfCrossover := aNumber