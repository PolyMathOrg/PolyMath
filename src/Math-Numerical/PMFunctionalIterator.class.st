"
A PMFunctionalIterator is an abstract base class for IterativeProcesses operating on a function. In the sense of these classes, a function is a block or object responding to the value: selector. 

Subclasses will redefine (in addition to methods prescribed in IterativeProcess)
	computeInitialValues 

New instances may be created with the function: class method, or existing instances may be assigned a new function with setFunction:

All functions are required to be single argument blocks, so multivariable functions must be wrapped in a way that value: takes an array of values as input.


"
Class {
	#name : #PMFunctionalIterator,
	#superclass : #PMIterativeProcess,
	#instVars : [
		'functionBlock'
	],
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #creation }
PMFunctionalIterator class >> function: aBlock [
	"Convenience method to create a instance with given function block."

	^ self new
		setFunction: aBlock;
		yourself
]

{ #category : #operation }
PMFunctionalIterator >> computeInitialValues [
	self subclassResponsibility
]

{ #category : #operation }
PMFunctionalIterator >> initializeIterations [
	"If no initial value has been defined, take 0 as the starting point (for lack of anything better)."

	functionBlock isNil ifTrue: [self error: 'No function supplied'].
	self computeInitialValues
]

{ #category : #information }
PMFunctionalIterator >> relativePrecision: aNumber [
	^self precisionOf: aNumber relativeTo: result abs
]

{ #category : #initialization }
PMFunctionalIterator >> setFunction: aBlock [
	( aBlock respondsTo: #value:)
		ifFalse:[ self error: 'Function block must implement the method value:'].
	functionBlock := aBlock
]
