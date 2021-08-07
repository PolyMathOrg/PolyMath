"
A `PMIterativeProcess` class is an abstract base class for processes which follow an iterative pattern. 

Subclasses of `PMIterativeProcess` will redefine:
- `initializeIterations`
- `evaluateIteration`
- `finalizeIterations`

The instance variable `result` is used to store the most recent/best result, and is accessible through the result selector.

The maximumIterations: method allows control of the amount of work this method is allowed to do. Each evaluation of the iteration increments the instance variable `iterations`. When this number exceeds `maximumIterations,` the evaluate method will stop the process, and answer `result`.

"
Class {
	#name : #PMIterativeProcess,
	#superclass : #Object,
	#instVars : [
		'precision',
		'desiredPrecision',
		'maximumIterations',
		'result',
		'iterations'
	],
	#category : #'Math-Core-Process'
}

{ #category : #default }
PMIterativeProcess class >> defaultMaximumIterations [
	"Private - Answers the default maximum number of iterations for newly created instances."
	^50
]

{ #category : #default }
PMIterativeProcess class >> defaultPrecision [
	"Private - Answers the default precision for newly created instances."
	^PMFloatingPointMachine new defaultNumericalPrecision
]

{ #category : #initialization }
PMIterativeProcess >> desiredPrecision: aNumber [
	"Defines the desired precision for the result."
	aNumber > 0
		ifFalse: [ ^self error: 'Illegal precision: ', aNumber printString].
	desiredPrecision := aNumber.
]

{ #category : #operation }
PMIterativeProcess >> evaluate [
	"Perform the iteration until either the desired precision is attained or the number of iterations exceeds the maximum."

	iterations := 0.
	self initializeIterations.
	
	[iterations := iterations + 1.
	precision := self evaluateIteration.
	self hasConverged or: [iterations >= maximumIterations]] 
			whileFalse: [].
	self finalizeIterations.
	^self result
]

{ #category : #operation }
PMIterativeProcess >> evaluateIteration [
	"Dummy method (must be implemented by subclass)."
	^self subclassResponsibility
]

{ #category : #operation }
PMIterativeProcess >> finalizeIterations [
	"Perform cleanup operation if needed (must be implemented by subclass)."
]

{ #category : #information }
PMIterativeProcess >> hasConverged [

	^precision <= desiredPrecision
]

{ #category : #initialization }
PMIterativeProcess >> initialize [

	desiredPrecision := self class defaultPrecision.
	maximumIterations := self class defaultMaximumIterations.
	^self
]

{ #category : #operation }
PMIterativeProcess >> initializeIterations [
	"Initialize the iterations (must be implemented by subclass when needed)."
]

{ #category : #information }
PMIterativeProcess >> iterations [
	"Answers the number of iterations performed."
	^iterations
]

{ #category : #private }
PMIterativeProcess >> limitedSmallValue: aNumber [
	"Private - prevent aNumber from being smaller in absolute value than a small number."
	^aNumber abs < PMFloatingPointMachine new smallNumber
			ifTrue: [ PMFloatingPointMachine new smallNumber]
			ifFalse:[ aNumber]
]

{ #category : #initialization }
PMIterativeProcess >> maximumIterations: anInteger [
	"Defines the maximum number of iterations."
	( anInteger isInteger and: [ anInteger > 1])
		ifFalse: [ ^self error: 'Invalid maximum number of iteration: ', anInteger printString].
	maximumIterations := anInteger.
]

{ #category : #information }
PMIterativeProcess >> precision [
	"Answer the attained precision for the result."
	^precision
]

{ #category : #information }
PMIterativeProcess >> precisionOf: aNumber1 relativeTo: aNumber2 [
	
	^aNumber2 > PMFloatingPointMachine new defaultNumericalPrecision
		ifTrue: [ aNumber1 / aNumber2]
		ifFalse:[ aNumber1]
]

{ #category : #information }
PMIterativeProcess >> result [
	"Answer the result of the iterations (if any)"
	^result
]
