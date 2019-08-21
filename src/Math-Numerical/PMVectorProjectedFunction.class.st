Class {
	#name : #PMVectorProjectedFunction,
	#superclass : #PMProjectedOneVariableFunction,
	#category : #'Math-Numerical'
}

{ #category : #information }
PMVectorProjectedFunction >> argumentWith: aNumber [

	^aNumber * self direction + self origin
]

{ #category : #information }
PMVectorProjectedFunction >> direction [
	^index
]

{ #category : #initialization }
PMVectorProjectedFunction >> direction: aVector [
	index := aVector.
]

{ #category : #information }
PMVectorProjectedFunction >> origin [
	^argument
]

{ #category : #initialization }
PMVectorProjectedFunction >> origin: aVector [
	argument := aVector.
]

{ #category : #display }
PMVectorProjectedFunction >> printOn: aStream [
	self origin printOn: aStream.
	aStream nextPutAll: ' ('.
	self direction printOn: aStream.
	aStream nextPut: $).
]
