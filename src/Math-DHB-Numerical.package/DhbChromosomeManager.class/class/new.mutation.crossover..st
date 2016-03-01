creation
new: anInteger mutation: aNumber1 crossover: aNumber2
	
	^self new populationSize: anInteger; rateOfMutation: aNumber1; rateOfCrossover: aNumber2; yourself