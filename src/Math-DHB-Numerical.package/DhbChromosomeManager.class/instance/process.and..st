operation
process: aChromosome1 and: aChromosome2 
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

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
					[population
						add: (self clone: aChromosome1);
						add: (self clone: aChromosome2)]]