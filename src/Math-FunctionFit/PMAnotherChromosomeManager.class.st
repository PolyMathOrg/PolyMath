"
AnotherChromosomeManager implements more specific operations for Floats. 
Is used by AnotherGeneticOptimizer
"
Class {
	#name : #PMAnotherChromosomeManager,
	#superclass : #PMVectorChromosomeManager,
	#instVars : [
		'hammersley',
		'rateOfLC',
		'rateOfEir'
	],
	#classVars : [
		'Primes'
	],
	#category : #'Math-FunctionFit'
}

{ #category : #utils }
PMAnotherChromosomeManager class >> integerDigitsFor: anInteger base: aBase [
	| n integer next result |
	"n:=(anInteger ln / aBase ln) floor ." "does not always work because of floating point errors. next 2 lines are better"
	"aBase has to be greater than 1. there is no error-checking"
	n:=0.
	[n:=n+1. (aBase raisedToInteger: n)<=anInteger ]whileTrue.
	result := Array new: n.
	integer :=anInteger .
	n to: 1 by: -1 do: [:i |
		next := integer // aBase .
		result at: i put: (integer - (next * aBase)).
		integer := next].
	^result
]

{ #category : #utils }
PMAnotherChromosomeManager class >> numberOfHamersleyPoints: n dimension: d randomized: aBoolean [
"a bit randomized "
|dist|
dist :=1.0 / n.
^(1 to:  n) collect: [:number| (1 to: d)collect: [:dim|
		( dim=1)
		ifTrue:[aBoolean ifTrue: [(number/n)- dist random] ifFalse: [(number/n)]]
		ifFalse: [|sum prime| 
			sum :=0.
			prime :=Primes at: dim-1.
			(self integerDigitsFor: number base: prime)
				reverse withIndexDo: [:i :index|sum:= i/(prime raisedToInteger: index)+sum.].
			aBoolean ifTrue: [sum + dist random] ifFalse: [sum] ] ]]. 
]

{ #category : #'instance creation' }
PMAnotherChromosomeManager class >> origin: anArray range: anotherArray [
^self new origin: anArray; range: anotherArray; yourself  
]

{ #category : #operation }
PMAnotherChromosomeManager >> crossover: aChromosome1 and: aChromosome2 [
"the Discrete Recombination  operator
that does not prefer schemata of certain parameters based on their position"
	| random new1 new2 |
	
	aChromosome1 = aChromosome2 ifTrue:[
		^ Array
			with: (self mutate: aChromosome2)
			with: (self mutate: aChromosome1) ].
	
	new1 := self clone: aChromosome1.
	new2 := self clone: aChromosome2.
	
	random := Random new.
	
	2 to: new1 size do: [ :i |
		(random next < 0.5) ifTrue: [
			new1 at: i put: (aChromosome2 at: i).
			new2 at: i put: (aChromosome1 at: i) ] ].
	
	^ Array with: new1 with: new2
]

{ #category : #operation }
PMAnotherChromosomeManager >> eirCrossover: aChromosome1 and: aChromosome2 [
"the Extended Intermediate Recombination  0.5 operator, slightly changed to make it more similar to linecrossover (distribution is more centered around Chromosome1, which is better than C2)"
| r new1 new2 dif|
dif:=aChromosome2 - aChromosome1.
dif norm=0 ifTrue:[^Array with:( self mutate: aChromosome2) with: (self mutate: aChromosome1) ].
r:=(1 to: aChromosome1 size) collect:[:i| 2.0 random -0.5] .
new1 := aChromosome1+ (r * dif).
r:=(1 to: aChromosome1 size) collect:[:i| 1.0 random -0.5] .
new2 := aChromosome1+ (r * dif).
^Array with: new1 with: new2

]

{ #category : #initialization }
PMAnotherChromosomeManager >> initialize [ 
super initialize .
populationSize :=100.
hammersley :=true.
rateOfEir :=0.16.
rateOfLC:=0.29.
rateOfMutation :=0.4.
rateOfCrossover :=0.15.
Primes  ifNil:[Primes :=Integer primesUpTo: 500].	"sufficient for up to 95 dimensions (parameters)"


]

{ #category : #information }
PMAnotherChromosomeManager >> isFullyPopulated [ 
population ifNil: [^false].
^super isFullyPopulated 
]

{ #category : #operation }
PMAnotherChromosomeManager >> lineCrossOver: aChromosome1 and: aChromosome2 [
"BGA Line Recombination; expects C1 to be better than C2, which is not correct at the moment, need to change that!!! mhm i think i did that."
	| new1 new2 line norm|
	line :=(aChromosome2 - aChromosome1).
	norm := line norm.
	norm =0 ifTrue:[^Array with: (self mutate: aChromosome1)with: (self mutate: aChromosome1)].
	line :=line/norm * (self smallDistribution).
	new1 :=aChromosome1 + line.
	new2 :=	aChromosome1 - line.
	^Array with: new1 with: new2
]

{ #category : #operation }
PMAnotherChromosomeManager >> mutate: aVector [
	"BGA mutation"
	| isMutated threshold new random index|
	
	isMutated := false.
	threshold := 1 / aVector size asFloat.
	new := aVector copy.
	random := Random new.
	
	1 to: aVector size do: [ :i |
		random next < threshold ifTrue: [
			isMutated := true.
			new at: i put: (new at: i) + 
				((random next < 0.5 ifTrue: [ 0.5 ] ifFalse:[ -0.5 ]) * (self randomRangeAt: i)) ] ].
	
	isMutated ifFalse: [
		index := aVector size random + 1.
		new at: index put: (new at: index) + 
			((random next < 0.5 ifTrue: [ 0.5 ] ifFalse:[ -0.5 ]) * (self randomRangeAt: index)) ].
	
	^ new
]

{ #category : #accessing }
PMAnotherChromosomeManager >> populationSize [ 
"AnotherGeneticOptimizer needs these data"
^populationSize 
]

{ #category : #printing }
PMAnotherChromosomeManager >> printOn: aStream [
    aStream
        nextPutAll: self class name;
        nextPutAll: '( popSize: ';print: populationSize ;
        nextPutAll: ' origin: ';print: origin ;
        nextPutAll: ' range: ';print: range ;
        nextPutAll: ' hammersley ';print: hammersley ;
        nextPutAll: ' MutRate: ';print: rateOfMutation ;
        nextPutAll: ' CORate: ';print: rateOfCrossover ;
	  nextPutAll: ' LCRate: ';print: rateOfLC ;
	  nextPutAll: ' EIRRate: ';print: rateOfEir;
	  nextPut: $) .
]

{ #category : #operation }
PMAnotherChromosomeManager >> process: aChromosome1 and: aChromosome2 [ 
	| random roll |
	random := Random new.
	roll := random next.
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
]

{ #category : #private }
PMAnotherChromosomeManager >> randomRangeAt: aPosition [
^(range at: aPosition )*(self smallDistribution )
]

{ #category : #operation }
PMAnotherChromosomeManager >> randomizePopulation [
hammersley ifFalse: [^super randomizePopulation ].
population :=self class numberOfHamersleyPoints: populationSize  dimension: origin size randomized: true.
population := population collect: [:aChr| aChr *range +origin ]
]

{ #category : #accessing }
PMAnotherChromosomeManager >> range [
"AnotherGeneticOptimizer needs these data"
^range 
]

{ #category : #initialization }
PMAnotherChromosomeManager >> rateOfCrossover: aNumber [  

	self testRate: aNumber oldRate: rateOfCrossover name: 'rateOfCrossover'.
	rateOfCrossover := aNumber
]

{ #category : #initialization }
PMAnotherChromosomeManager >> rateOfEir: aNumber [ 

	self testRate: aNumber oldRate: rateOfEir name: 'rateOfEir'.
	rateOfEir := aNumber
]

{ #category : #initialization }
PMAnotherChromosomeManager >> rateOfLC: aNumber [ 

	self testRate: aNumber oldRate: rateOfLC name: 'rateOfLC'.
	rateOfLC := aNumber
]

{ #category : #initialization }
PMAnotherChromosomeManager >> rateOfMutation: aNumber [
	self testRate: aNumber oldRate: rateOfMutation name: 'rateOfMutation'.
	rateOfMutation := aNumber
]

{ #category : #private }
PMAnotherChromosomeManager >> smallDistribution [
	"an exponential distribution as used by H. Mühlenbein"
	| random |
	random := Random new.
	^ 2 raisedTo: (16 * random next negated)
]

{ #category : #private }
PMAnotherChromosomeManager >> testRate:aFloat oldRate: asecondFloat name:aString [
(aFloat between: 0 and: 1) ifFalse: [(DomainError new)from:0;to:1;messageText: 'Value outside [0 , 1]';signalIn: thisContext sender].
(rateOfCrossover + rateOfMutation + rateOfLC + rateOfEir + aFloat - asecondFloat)>1.000000000000001 "for Float inaccuracies"
	ifTrue: [Warning  signal:'All rates together are higher than 1, if ' , aString, ' is set to ',aFloat asString ].
]

{ #category : #initialization }
PMAnotherChromosomeManager >> useHammersley:  aBoolean [
"default is true"
hammersley :=aBoolean
]
