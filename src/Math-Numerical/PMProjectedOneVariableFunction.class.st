Class {
	#name : #PMProjectedOneVariableFunction,
	#superclass : #Object,
	#instVars : [
		'index',
		'function',
		'argument'
	],
	#category : #'Math-Numerical'
}

{ #category : #creation }
PMProjectedOneVariableFunction class >> function: aVectorFunction [
	^super new initialize: aVectorFunction
]

{ #category : #information }
PMProjectedOneVariableFunction >> argumentWith: aNumber [

	^argument at: index put: aNumber; yourself
]

{ #category : #transformation }
PMProjectedOneVariableFunction >> bumpIndex [

	index
		ifNil: [ index := 1 ]
		ifNotNil: [
			index := index + 1.
			index > argument size ifTrue: [ index := 1 ] ]
]

{ #category : #information }
PMProjectedOneVariableFunction >> index [

	index ifNil: [ index := 1 ].
	^ index
]

{ #category : #initialization }
PMProjectedOneVariableFunction >> initialize: aFunction [
	function := aFunction.
	^self
]

{ #category : #initialization }
PMProjectedOneVariableFunction >> setArgument: anArrayOrVector [
	argument := anArrayOrVector copy
]

{ #category : #initialization }
PMProjectedOneVariableFunction >> setIndex: anInteger [
	index := anInteger
]

{ #category : #information }
PMProjectedOneVariableFunction >> value: aNumber [
	^function value: ( self argumentWith: aNumber)
]
