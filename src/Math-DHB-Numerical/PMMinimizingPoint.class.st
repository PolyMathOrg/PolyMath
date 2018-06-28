Class {
	#name : #PMMinimizingPoint,
	#superclass : #Object,
	#instVars : [
		'value',
		'position'
	],
	#category : 'Math-DHB-Numerical-Math-FunctionIterator'
}

{ #category : #creation }
PMMinimizingPoint class >> new: aVector value: aNumber [
	^self new vector: aVector; value: aNumber; yourself
]

{ #category : #creation }
PMMinimizingPoint class >> vector: aVector function: aFunction [ 
	^self new: aVector value: (aFunction value: aVector)
]

{ #category : #comparing }
PMMinimizingPoint >> =aMPoint [
"only for testing purposes"
^(value = aMPoint value)& (position = aMPoint position)
]

{ #category : #information }
PMMinimizingPoint >> better: anOptimizingPoint [
	^ value <= anOptimizingPoint value
]

{ #category : #information }
PMMinimizingPoint >> betterThan: anOptimizingPoint [
	^value < anOptimizingPoint value
]

{ #category : #information }
PMMinimizingPoint >> position [
	^position
]

{ #category : #display }
PMMinimizingPoint >> printOn: aStream [ 
	position printOn: aStream.
	aStream
		nextPut: $:;
		space.
	value printOn: aStream
]

{ #category : #information }
PMMinimizingPoint >> value [
	^value
]

{ #category : #initialization }
PMMinimizingPoint >> value: aNumber [
	value := aNumber.
]

{ #category : #initialization }
PMMinimizingPoint >> vector: aVector [ 
	position := aVector
]
