creation
new: anInteger mutation: aNumber1 crossover: aNumber2
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "
	^self new populationSize: anInteger; rateOfMutation: aNumber1; rateOfCrossover: aNumber2; yourself