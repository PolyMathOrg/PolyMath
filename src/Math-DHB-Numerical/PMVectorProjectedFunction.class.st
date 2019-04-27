Class {
	#name : #PMVectorProjectedFunction,
	#superclass : #PMProjectedOneVariableFunction,
	#category : #'Math-DHB-Numerical'
}

{ #category : #information }
PMVectorProjectedFunction >> argumentWith: aNumber [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	^aNumber * self direction + self origin
]

{ #category : #information }
PMVectorProjectedFunction >> direction [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	^index
]

{ #category : #initialization }
PMVectorProjectedFunction >> direction: aVector [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	index := aVector.
]

{ #category : #information }
PMVectorProjectedFunction >> origin [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	^argument
]

{ #category : #initialization }
PMVectorProjectedFunction >> origin: aVector [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	argument := aVector.
]

{ #category : #display }
PMVectorProjectedFunction >> printOn: aStream [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	self origin printOn: aStream.
	aStream nextPutAll: ' ('.
	self direction printOn: aStream.
	aStream nextPut: $).
]
