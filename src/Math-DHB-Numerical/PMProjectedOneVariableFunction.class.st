Class {
	#name : #PMProjectedOneVariableFunction,
	#superclass : #Object,
	#instVars : [
		'index',
		'function',
		'argument'
	],
	#category : 'Math-DHB-Numerical'
}

{ #category : #creation }
PMProjectedOneVariableFunction class >> function: aVectorFunction [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	^super new initialize: aVectorFunction
]

{ #category : #information }
PMProjectedOneVariableFunction >> argumentWith: aNumber [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	^argument at: index put: aNumber; yourself
]

{ #category : #transformation }
PMProjectedOneVariableFunction >> bumpIndex [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	index isNil
		ifTrue: [ index := 1]
		ifFalse:[ index := index + 1.
				  index > argument size
					ifTrue: [ index := 1].
				].
]

{ #category : #information }
PMProjectedOneVariableFunction >> index [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	index isNil
		ifTrue: [ index := 1].
	^index
]

{ #category : #initialization }
PMProjectedOneVariableFunction >> initialize: aFunction [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	function := aFunction.
	^self
]

{ #category : #initialization }
PMProjectedOneVariableFunction >> setArgument: anArrayOrVector [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	argument := anArrayOrVector copy.
]

{ #category : #initialization }
PMProjectedOneVariableFunction >> setIndex: anInteger [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	index := anInteger.
]

{ #category : #information }
PMProjectedOneVariableFunction >> value: aNumber [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	^function value: ( self argumentWith: aNumber)
]
