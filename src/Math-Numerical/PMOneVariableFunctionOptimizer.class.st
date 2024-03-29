Class {
	#name : #PMOneVariableFunctionOptimizer,
	#superclass : #PMFunctionOptimizer,
	#instVars : [
		'randomGenerator'
	],
	#classVars : [
		'GoldenSection'
	],
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #information }
PMOneVariableFunctionOptimizer class >> defaultPrecision [
	"Private"

	^ Float defaultComparisonPrecision * 10
]

{ #category : #information }
PMOneVariableFunctionOptimizer class >> goldenSection [
	"Private"

	GoldenSection ifNil: [ GoldenSection := 3 - 5 sqrt / 2 ].
	^ GoldenSection
]

{ #category : #operation }
PMOneVariableFunctionOptimizer >> computeInitialValues [

	| finder |
	[ bestPoints size > 3 ] whileTrue: [ bestPoints removeLast ].

	bestPoints size = 3 ifTrue: [ self hasBracketingPoints ifFalse: [ bestPoints removeLast ] ].

	bestPoints size < 3 ifFalse: [ ^ self ].

	finder := PMOptimizingBracketFinder forOptimizer: self.
	self randomGenerator ifNotNil: [ :generator | finder randomGenerator: generator ].
	finder evaluate
]

{ #category : #information }
PMOneVariableFunctionOptimizer >> computePrecision [

	^ self precisionOf: ((bestPoints at: 2) position - (bestPoints at: 3) position) abs relativeTo: (bestPoints at: 1) position abs
]

{ #category : #operation }
PMOneVariableFunctionOptimizer >> evaluateIteration [

	self addPointAt: self nextXValue.
	bestPoints removeAt: self indexOfOuterPoint.
	^ self computePrecision
]

{ #category : #information }
PMOneVariableFunctionOptimizer >> hasBracketingPoints [
	"Private"

	| x1 |
	x1 := (bestPoints at: 1) position.
	^ (bestPoints at: 2) position - x1 * ((bestPoints at: 3) position - x1) < 0
]

{ #category : #information }
PMOneVariableFunctionOptimizer >> indexOfOuterPoint [
	"Private"

	| inferior superior x |
	inferior := false.
	superior := false.
	x := bestPoints first position.
	2 to: 4 do: [ :n |
		(bestPoints at: n) position < x
			ifTrue: [
				inferior ifTrue: [ ^ n ].
				inferior := true ]
			ifFalse: [
				superior ifTrue: [ ^ n ].
				superior := true ] ]
]

{ #category : #information }
PMOneVariableFunctionOptimizer >> nextXValue [
	"Private"

	| d3 d2 x1 |
	x1 := (bestPoints at: 1) position.
	d2 := (bestPoints at: 2) position - x1.
	d3 := (bestPoints at: 3) position - x1.
	^ (d3 abs > d2 abs
		   ifTrue: [ d3 ]
		   ifFalse: [ d2 ]) * self class goldenSection + x1
]

{ #category : #accessing }
PMOneVariableFunctionOptimizer >> randomGenerator [

	^ randomGenerator
]

{ #category : #accessing }
PMOneVariableFunctionOptimizer >> randomGenerator: anObject [

	randomGenerator := anObject
]

{ #category : #transformation }
PMOneVariableFunctionOptimizer >> reset [

	bestPoints removeAll
]
