operation
crossover: aChromosome1 and: aChromosome2
"the Discrete Recombination  operator
that does not prefer schemata of certain parameters based on their position"
|new1 new2|
	aChromosome1=aChromosome2 ifTrue:[^Array with:( self mutate: aChromosome2) with: (self mutate: aChromosome1) ].
	new1 := self clone: aChromosome1.
	new2 := self clone: aChromosome2.
	2 to: new1 size do: [:i| (Float random <0.5)ifTrue:[
			new1 at: i put: (aChromosome2 at: i).
			new2 at: i put: (aChromosome1 at: i)]].
	^Array with: new1 with: new2