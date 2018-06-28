Class {
	#name : #PMChromosomeManager,
	#superclass : #Object,
	#instVars : [
		'population',
		'populationSize',
		'rateOfMutation',
		'rateOfCrossover'
	],
	#category : 'Math-Chromosome'
}

{ #category : #creation }
PMChromosomeManager class >> new: anInteger mutation: aNumber1 crossover: aNumber2 [
	
	^self new populationSize: anInteger; rateOfMutation: aNumber1; rateOfCrossover: aNumber2; yourself
]

{ #category : #operation }
PMChromosomeManager >> clone: aChromosome [

	^aChromosome copy
]

{ #category : #operation }
PMChromosomeManager >> crossover: aChromosome1 and: aChromosome2 [
	
	^self subclassResponsibility
]

{ #category : #information }
PMChromosomeManager >> isFullyPopulated [
		
	^population size >= populationSize
]

{ #category : #operation }
PMChromosomeManager >> mutate: aChromosome [
	
	^self subclassResponsibility
]

{ #category : #information }
PMChromosomeManager >> population [
		
	^population
]

{ #category : #initialization }
PMChromosomeManager >> populationSize: anInteger [

	populationSize := anInteger.
]

{ #category : #operation }
PMChromosomeManager >> process: aChromosome1 and: aChromosome2 [ 
	
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
]

{ #category : #creation }
PMChromosomeManager >> randomChromosome [
	self subclassResponsibility
]

{ #category : #operation }
PMChromosomeManager >> randomizePopulation [

	self reset.
	[self isFullyPopulated] 
		whileFalse: [population add: self randomChromosome]
]

{ #category : #initialization }
PMChromosomeManager >> rateOfCrossover: aNumber [ 

	(aNumber between: 0 and: 1) 
		ifFalse: [self error: 'Illegal rate of cross-over'].
	rateOfCrossover := aNumber
]

{ #category : #initialization }
PMChromosomeManager >> rateOfMutation: aNumber [ 

	(aNumber between: 0 and: 1) 
		ifFalse: [self error: 'Illegal rate of mutation'].
	rateOfMutation := aNumber
]

{ #category : #transformation }
PMChromosomeManager >> reset [
	
	population := OrderedCollection new: populationSize.
]
