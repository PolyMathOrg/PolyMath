"
An ODESystem is a wrapper for a system of or a single ordinary differential equation.
"
Class {
	#name : #ODESystem,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
ODESystem class >> block: aBlock [ 
	^ (self new block: aBlock; yourself)
]

{ #category : #accessing }
ODESystem >> block [
	^ block
]

{ #category : #accessing }
ODESystem >> block: aBlock [
	"aBlock should be dyadic, the first parameter is x, the second t"
	self assert: aBlock argumentCount = 2.
	^ block := aBlock
]

{ #category : #evaluation }
ODESystem >> state: aState time: aTime [
	^ self block value: aState value: aTime 
]
