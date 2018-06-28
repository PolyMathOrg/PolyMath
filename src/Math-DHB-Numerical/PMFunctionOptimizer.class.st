Class {
	#name : #PMFunctionOptimizer,
	#superclass : #PMFunctionalIterator,
	#instVars : [
		'optimizingPointClass',
		'bestPoints'
	],
	#category : 'Math-DHB-Numerical-Math-FunctionIterator'
}

{ #category : #information }
PMFunctionOptimizer class >> defaultPrecision [
		"Private"
	^super defaultPrecision * 100
]

{ #category : #creation }
PMFunctionOptimizer class >> forOptimizer: aFunctionOptimizer [
		"Private"
	^self new initializeForOptimizer: aFunctionOptimizer
]

{ #category : #creation }
PMFunctionOptimizer class >> maximizingFunction: aFunction [
	^super new initializeAsMaximizer; setFunction: aFunction
]

{ #category : #creation }
PMFunctionOptimizer class >> minimizingFunction: aFunction [
	^super new initializeAsMinimizer; setFunction: aFunction
]

{ #category : #transformation }
PMFunctionOptimizer >> addPointAt: aNumber [
	bestPoints add: (optimizingPointClass vector: aNumber function: functionBlock)
]

{ #category : #information }
PMFunctionOptimizer >> bestPoints [
	"Private"

	^ bestPoints
]

{ #category : #operation }
PMFunctionOptimizer >> finalizeIterations [
	result := bestPoints first position
]

{ #category : #information }
PMFunctionOptimizer >> functionBlock [
		"Private"
	^functionBlock
]

{ #category : #initialization }
PMFunctionOptimizer >> initialValue: aVector [
	result := aVector copy
]

{ #category : #initialization }
PMFunctionOptimizer >> initialize [
		"Private"
	bestPoints := SortedCollection sortBlock: [ :a :b | a betterThan: b].
	^super initialize
]

{ #category : #initialization }
PMFunctionOptimizer >> initializeAsMaximizer [
		"Private"
	optimizingPointClass := PMMaximizingPoint.
	^self initialize
]

{ #category : #initialization }
PMFunctionOptimizer >> initializeAsMinimizer [
		"Private"
	optimizingPointClass := PMMinimizingPoint
]

{ #category : #initialization }
PMFunctionOptimizer >> initializeForOptimizer: aFunctionOptimizer [
		"Private"
	optimizingPointClass := aFunctionOptimizer pointClass.
	functionBlock := aFunctionOptimizer functionBlock.
	^self initialize
]

{ #category : #information }
PMFunctionOptimizer >> pointClass [
		"Private"
	^optimizingPointClass
]

{ #category : #display }
PMFunctionOptimizer >> printOn: aStream [
	super printOn: aStream.
	bestPoints do: [ :each | aStream cr. each printOn: aStream]
]
