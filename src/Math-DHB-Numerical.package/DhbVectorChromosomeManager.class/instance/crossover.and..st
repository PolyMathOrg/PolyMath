operation
crossover: aChromosome1 and: aChromosome2
		
	| index new1 new2|
	index := ( aChromosome1 size - 1) random + 2.
	new1 := self clone: aChromosome1.
	new1 replaceFrom: index to: new1 size with: aChromosome2 startingAt: index.
	new2 := self clone: aChromosome2.
	new2 replaceFrom: index to: new2 size with: aChromosome1 startingAt: index.
	^Array with: new1 with: new2