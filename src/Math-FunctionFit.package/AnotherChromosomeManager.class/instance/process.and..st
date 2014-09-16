operation
process: aChromosome1 and: aChromosome2 
	| roll |
	roll := Number random.
	roll < rateOfCrossover 
		ifTrue: [population addAll: (self crossover: aChromosome1 and: aChromosome2)]
		ifFalse: 
			[roll < (rateOfCrossover + rateOfMutation) 
				ifTrue: 
					[population
						add: (self mutate: aChromosome1);
						add: (self mutate: aChromosome2)]
				ifFalse: 
					[roll < (rateOfCrossover + rateOfMutation+rateOfEir) 
						ifTrue: 
							[population addAll: (self eirCrossover: aChromosome1 and: aChromosome2)]
						ifFalse: [roll < (rateOfCrossover + rateOfMutation+rateOfEir+rateOfLC) 
							ifTrue: 
								[population addAll: (self lineCrossOver: aChromosome1 and: aChromosome2)]
							ifFalse: [population
								add: (self clone: aChromosome1);
								add: (self clone: aChromosome2)]]]]