initialization
rateOfMutation: aNumber 
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

	(aNumber between: 0 and: 1) 
		ifFalse: [self error: 'Illegal rate of mutation'].
	rateOfMutation := aNumber