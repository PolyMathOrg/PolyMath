"
AnotherGeneticOptimizer is a more efficient GeneticOptimizer, that is necessary for the correct use of AnotherChromosomeManager.
"
Class {
	#name : #PMAnotherGeneticOptimizer,
	#superclass : #PMGeneticOptimizer,
	#instVars : [
		'rangeScale',
		'steadyState',
		'removeLast',
		'bestValueHistory',
		'worstValueHistory',
		'statistics',
		'whateverHistory',
		'originalFunction'
	],
	#category : 'Math-FunctionFit'
}

{ #category : #information }
PMAnotherGeneticOptimizer class >> defaultPrecision [
	^PMFloatingPointMachine new machinePrecision
]

{ #category : #'instance creation' }
PMAnotherGeneticOptimizer class >> function: aBlock minimumValues: anArray maximumValues: anotherArray [
|o m|
o:=self minimizingFunction:aBlock.
m :=PMAnotherChromosomeManager new.
m  populationSize: 50.
o chromosomeManager:m.
o maximumIterations: 170.
(anotherArray - anArray allSatisfy: [:each| each >0]) ifFalse: 
	[^DomainError signal: 'maximum values should be greater than minimum values'].
m origin: anArray.
m range: (anotherArray - anArray).
^o

]

{ #category : #transformation }
PMAnotherGeneticOptimizer >> add: aMinimizingPoint [
^bestPoints add: aMinimizingPoint 
]

{ #category : #transformation }
PMAnotherGeneticOptimizer >> addPointAt: aVector [
"makes room if necessary and adds point only, 
if there is already enough  room or the bestPoints get better with the new point" 
	|p|
	p:=optimizingPointClass vector: aVector function: functionBlock.
	((p value isInfinite)or:[p value isNaN]) ifTrue:[^self].
	(bestPoints size >= chromosomeManager populationSize)
		ifTrue: [(p betterThan: bestPoints last ) ifTrue: 
			[removeLast ifTrue: [bestPoints removeLast] ifFalse: [self removeNearestTo: p].
			self add: p] ]  
		ifFalse: [self add: p].
]

{ #category : #information }
PMAnotherGeneticOptimizer >> bestValueHistory [ 
^bestValueHistory 
]

{ #category : #accessing }
PMAnotherGeneticOptimizer >> calcStatistics:aBoolean [
"calc the best and the worst function return history. default is false."
statistics :=aBoolean 
]

{ #category : #accessing }
PMAnotherGeneticOptimizer >> chromosomeManager [
^chromosomeManager  

]

{ #category : #operation }
PMAnotherGeneticOptimizer >> collectPoints [
	| size |
	size := steadyState
		ifTrue: [ chromosomeManager populationSize ]
		ifFalse: [ 1 ].
	bestPoints size > size
		ifTrue: [ bestPoints := bestPoints copyFrom: 1 to: size ].
	chromosomeManager population do: [ :each | self addPointAt: each ].
	result := bestPoints first position
]

{ #category : #information }
PMAnotherGeneticOptimizer >> computePrecision: whateverData [  "can be changed to check how the ga behaves"	
	statistics ifTrue:
	[bestValueHistory add: bestPoints first value.
	whateverHistory add: whateverData .
	worstValueHistory add: bestPoints last value].	
	^steadyState ifTrue: [bestPoints last value - bestPoints first value] ifFalse: [1]
]

{ #category : #operation }
PMAnotherGeneticOptimizer >> evaluate [
^Cursor wait showWhile: [super evaluate]
]

{ #category : #operation }
PMAnotherGeneticOptimizer >> evaluateIteration [
	self nextGeneration.
	self mixupGeneration.
	^ self computePrecision: bestPoints first position first
]

{ #category : #private }
PMAnotherGeneticOptimizer >> findNearestTo: anOptimizingPointClass [
	|max dist|
	max:=Array with: bestPoints size with: Float infinity.
	(bestPoints size to: 2 by: -1)
		do: [:index |(anOptimizingPointClass better: (bestPoints at: index) ) ifTrue: 
			[dist:=(anOptimizingPointClass position - (bestPoints at: index) position / chromosomeManager range)abs sum.
			 dist=0 ifTrue:[^index ].
			 (dist < max second) ifTrue: [max at: 1 put: index. max at: 2 put: dist]] ifFalse: 
			[ ^max first]] .
	^max first.
]

{ #category : #initialization }
PMAnotherGeneticOptimizer >> initialize [ 
super initialize .
rangeScale :=true.
steadyState :=true.
removeLast:=false.
statistics :=false.
]

{ #category : #operation }
PMAnotherGeneticOptimizer >> initializeIterations [
	bestPoints size>=chromosomeManager populationSize 
		ifTrue: [bestPoints := bestPoints copyFrom: 1 to: (bestPoints size // 2 max: 1)].
	super initializeIterations.
	bestValueHistory:=OrderedCollection new.
	worstValueHistory:=OrderedCollection new.
	whateverHistory:=OrderedCollection new.

]

{ #category : #operation }
PMAnotherGeneticOptimizer >> mixupGeneration [
	| doMixUp r r1 |
	r := bestPoints first value.
	r1 := (bestPoints at: bestPoints size - 1) value.
	doMixUp := r = 0
		ifTrue: [ r1 = 0
				ifTrue: [ true ]
				ifFalse: [( r1 - r) <  1e-20 ] ]
		ifFalse: [ ((r1 - r) / r) abs < 0.00001 ].
	doMixUp
		ifTrue: [bestPoints := bestPoints copyFrom: 1 to: (bestPoints size // 2 max: 1).
				chromosomeManager randomizePopulation.
				self collectPoints ]
]

{ #category : #operation }
PMAnotherGeneticOptimizer >> nextGeneration [
	| randomScale |
	randomScale := rangeScale
		ifTrue: [ self rangeScale ]
		ifFalse: [ self randomScale ].
	randomScale at: randomScale size put: 1.
	chromosomeManager reset.
	[ chromosomeManager isFullyPopulated ] whileFalse: [ self processRandomParents: randomScale ].
	self collectPoints
]

{ #category : #printing }
PMAnotherGeneticOptimizer >> printOn1: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: '( function: ';
		nextPutAll: originalFunction asString
]

{ #category : #printing }
PMAnotherGeneticOptimizer >> printOn2: aStream [
	aStream
		nextPutAll: ' manager: ';
		print: chromosomeManager;
		nextPutAll: ' maxIterations: ';
		print: maximumIterations;
		nextPutAll: ' rangeScale: ';
		print: rangeScale;
		nextPutAll: ' removeLast: ';
		print: removeLast;
		nextPutAll: ' steadyState: ';
		print: steadyState;
		nextPutAll: ' statistics: ';
		print: statistics;
		nextPutAll: ' result: ';
		print: result;
		nextPut: $)
]

{ #category : #printing }
PMAnotherGeneticOptimizer >> printOn: aStream [
	self printOn1: aStream.
	self printOn2: aStream
]

{ #category : #operation }
PMAnotherGeneticOptimizer >> processRandomParents: aNumberArray [
"puts the better chromosome at the first place (is eg necessary for lineCrossOver:and:)"
	| pos1 pos2 c |
	pos1 := self randomIndex: aNumberArray.
	pos2 := self randomIndex: aNumberArray.
	pos1 > pos2 ifTrue: [c := pos1. pos1 := pos2. pos2 := c].
	chromosomeManager process: ( bestPoints at: pos1) position
						and:  ( bestPoints at: pos2) position.
]

{ #category : #operation }
PMAnotherGeneticOptimizer >> rangeScale [
"keeps constant selection pressure"
	| size best|
size:=bestPoints size -1.
best := 0.0 .
^(size to: 1 by: (-1)) collect: [:i | best := 2 * i / (size * (size + 1)) + best].

]

{ #category : #accessing }
PMAnotherGeneticOptimizer >> rangeScale: aBoolean [
"if rangeScale is false the old method of selecting an individual proportionally to its fitness is used, if it is true a constant selection pressure is used. default is true. "
rangeScale :=aBoolean 
]

{ #category : #accessing }
PMAnotherGeneticOptimizer >> removeLast: aBoolean [
"if steadyState is true, then either the worst individual (removeLast:true) is deleted, or the most similar to the new individual (removeLast:false) is deleted, to make room for the new one. default is false, since this keeps diversity high. But it is a bit slow"
removeLast :=aBoolean .
]

{ #category : #transformation }
PMAnotherGeneticOptimizer >> removeNearestTo: anOptimizingPointClass [
bestPoints removeAt: (self findNearestTo: anOptimizingPointClass).
]

{ #category : #operation }
PMAnotherGeneticOptimizer >> resetBestPoints [ 
"for repeated evaluating with different starting populations"
bestPoints := SortedCollection sortBlock: [ :a :b | a betterThan: b].
result :=nil.
]

{ #category : #initialization }
PMAnotherGeneticOptimizer >> setFunction: aBlock [
	( aBlock respondsTo: #value:)
		ifFalse:[ self error: 'Function block must implement the method value:'].
	originalFunction :=aBlock . "necessary for subclass; do not delete that nonsense!"
	functionBlock := aBlock.
	self resetBestPoints.

]

{ #category : #accessing }
PMAnotherGeneticOptimizer >> steadyState: aBoolean [
"if steadyState is false, the old method of making room for new individuals after one iteration and just keeping the best so far is used. If it is true (the default), then everything is kept and only offspring that are better than the worst so far are put into the population."
steadyState :=aBoolean .
]

{ #category : #information }
PMAnotherGeneticOptimizer >> whateverHistory [  
^whateverHistory 
]

{ #category : #information }
PMAnotherGeneticOptimizer >> worstValueHistory [ 
^worstValueHistory 
]
