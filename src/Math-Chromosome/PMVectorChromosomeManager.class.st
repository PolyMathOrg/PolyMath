Class {
	#name : #PMVectorChromosomeManager,
	#superclass : #PMChromosomeManager,
	#instVars : [
		'origin',
		'range'
	],
	#category : 'Math-Chromosome'
}

{ #category : #operation }
PMVectorChromosomeManager >> crossover: aChromosome1 and: aChromosome2 [
		
	| index new1 new2|
	index := ( aChromosome1 size - 1) random + 2.
	new1 := self clone: aChromosome1.
	new1 replaceFrom: index to: new1 size with: aChromosome2 startingAt: index.
	new2 := self clone: aChromosome2.
	new2 replaceFrom: index to: new2 size with: aChromosome1 startingAt: index.
	^Array with: new1 with: new2
]

{ #category : #operation }
PMVectorChromosomeManager >> mutate: aVector [
		
	| index |
	index := aVector size random + 1.
	^( aVector copy)
			at: index put: ( self randomComponent: index);
			yourself
]

{ #category : #initialization }
PMVectorChromosomeManager >> origin: aVector [
		
	origin := aVector.
]

{ #category : #creation }
PMVectorChromosomeManager >> randomChromosome [
		
	^( ( 1 to: origin size) collect: [ :n | self randomComponent: n]) asPMVector
]

{ #category : #information }
PMVectorChromosomeManager >> randomComponent: anInteger [

	^( range at: anInteger) asFloat random + ( origin at: anInteger)
]

{ #category : #initialization }
PMVectorChromosomeManager >> range: aVector [
	
	range := aVector.
]
