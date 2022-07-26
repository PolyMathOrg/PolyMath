Class {
	#name : #PMGeneticOptimizer,
	#superclass : #PMFunctionOptimizer,
	#instVars : [
		'chromosomeManager'
	],
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #information }
PMGeneticOptimizer class >> defaultMaximumIterations [
		"Private"
	^500
]

{ #category : #information }
PMGeneticOptimizer class >> defaultPrecision [
		"Private"
	^0
]

{ #category : #transformation }
PMGeneticOptimizer >> addPointAt: aNumber [ 
	"necessary since nan's and infinites can throw off calculations. and calculations become a tiny bit more efficient"
	| p |
 	p:=optimizingPointClass vector: aNumber function: functionBlock.
 	((p value isInfinite)or:[p value isNaN]) ifFalse: [bestPoints add: p].
]

{ #category : #initialization }
PMGeneticOptimizer >> chromosomeManager: aChromosomeManager [
	chromosomeManager := aChromosomeManager
]

{ #category : #operation }
PMGeneticOptimizer >> collectPoints [
	"Private"

	| bestPoint |
	bestPoints isEmpty ifFalse: [bestPoint := bestPoints first].
	bestPoints removeAll.
	chromosomeManager population do: [:each | self addPointAt: each].
	bestPoint ifNotNil: [:b|bestPoints add: b].
	result := bestPoints first position
]

{ #category : #information }
PMGeneticOptimizer >> computePrecision [
	^ 1
]

{ #category : #operation }
PMGeneticOptimizer >> evaluateIteration [
	| randomScale |
	randomScale := self randomScale.
	randomScale at: randomScale size put: 1. "for floating point errors in #randomScale "
	chromosomeManager reset.
	[ chromosomeManager isFullyPopulated]
		whileFalse: [ self processRandomParents: randomScale].
	self collectPoints.
	^self computePrecision
]

{ #category : #operation }
PMGeneticOptimizer >> initializeIterations [
	chromosomeManager randomizePopulation.
	self collectPoints
]

{ #category : #operation }
PMGeneticOptimizer >> processRandomParents: aNumberArray [
		"Private"
	chromosomeManager process: ( bestPoints at: ( self randomIndex: aNumberArray)) position
						and:  ( bestPoints at: ( self randomIndex: aNumberArray)) position
]

{ #category : #information }
PMGeneticOptimizer >> randomIndex: aNumberArray [
		"Private"
	| random x n |
	random := Random new.
	x := random next.
	n := 1.
	aNumberArray do: 
		[ :each |
		  x < each
			ifTrue: [ ^n].
		  n := n + 1.
		].
	 self error: 'should not be reached'.  "the original line was there because of a bug that should be taken care of now"
]

{ #category : #information }
PMGeneticOptimizer >> randomScale [
		"Private"
		"changes take care of divide by zero error"
	| norm fBest fWorst answer|
	fBest := bestPoints first value.
	fWorst := bestPoints last value.
	norm :=fBest - fWorst.
	norm =0 ifTrue: [
	norm:= 1 / bestPoints size.
	answer := bestPoints collect: [:each| norm] ] ifFalse: [
		norm := 1 / norm.
		answer := bestPoints collect: [ :each | (each value - fWorst) * norm] ].
	norm := 1 / ( answer inject: 0 into: [ :sum :each | each + sum]).
	fBest := 0.
	^answer collect: [ :each | fBest := each * norm + fBest. fBest]


]
