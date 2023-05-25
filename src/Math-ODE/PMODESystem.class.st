"
An ODESystem is a wrapper for a system of or a single ordinary differential equation.
"
Class {
	#name : #PMODESystem,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMODESystem class >> block: aBlock [
	^ (self new block: aBlock; yourself)
]

{ #category : #accessing }
PMODESystem >> block [
	^ block
]

{ #category : #accessing }
PMODESystem >> block: aBlock [
	"aBlock should be dyadic, the first parameter is x, the second t"
	self assert: aBlock argumentCount = 2.
	^ block := aBlock
]

{ #category : #evaluation }
PMODESystem >> state: aState time: aTime [
	^ self block value: aState value: aTime
]
