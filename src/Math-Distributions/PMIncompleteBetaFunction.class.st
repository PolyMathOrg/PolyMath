Class {
	#name : #PMIncompleteBetaFunction,
	#superclass : #Object,
	#instVars : [
		'alpha1',
		'alpha2',
		'fraction',
		'inverseFraction',
		'logNorm'
	],
	#category : #'Math-Distributions-Beta'
}

{ #category : #creation }
PMIncompleteBetaFunction class >> shape: aNumber1 shape: aNumber2 [ 
	"Create an instance of the receiver with given shape parameters."

	^self new initialize: aNumber1 shape: aNumber2
]

{ #category : #private }
PMIncompleteBetaFunction >> evaluateFraction: aNumber [ 

	fraction isNil 
		ifTrue: 
			[fraction := PMIncompleteBetaFractionTermServer new.
			fraction setParameter: alpha1 second: alpha2].
	fraction setArgument: aNumber.
	^(PMContinuedFraction server: fraction)
		desiredPrecision: PMFloatingPointMachine new defaultNumericalPrecision;
		evaluate
]

{ #category : #private }
PMIncompleteBetaFunction >> evaluateInverseFraction: aNumber [ 

	inverseFraction isNil 
		ifTrue: 
			[inverseFraction := PMIncompleteBetaFractionTermServer new.
			inverseFraction setParameter: alpha2 second: alpha1].
	inverseFraction setArgument: (1 - aNumber).
	^(PMContinuedFraction server: inverseFraction)
		desiredPrecision: PMFloatingPointMachine new defaultNumericalPrecision;
		evaluate
]

{ #category : #initialization }
PMIncompleteBetaFunction >> initialize: aNumber1 shape: aNumber2 [ 

	alpha1 := aNumber1.
	alpha2 := aNumber2.
	logNorm := ( alpha1 + alpha2) logGamma - alpha1 logGamma - alpha2 logGamma.
	^self
]

{ #category : #information }
PMIncompleteBetaFunction >> value: aNumber [
	"Compute the value of the receiver for argument aNumber.
	Note: aNumber must be between 0 and 1 (otherwise an exception will occur)."
	| norm |
	aNumber = 0
		ifTrue: [ ^0].
	aNumber = 1
		ifTrue: [ ^1].
	norm :=  ( aNumber ln * alpha1 + ( ( 1 - aNumber) ln * alpha2) + logNorm) exp.
	^( alpha1 + alpha2 + 2) * aNumber < ( alpha1 + 1)
		ifTrue: [ norm / ( ( self evaluateFraction: aNumber) * alpha1)]
		ifFalse:[ 1 - ( norm / ( ( self evaluateInverseFraction: aNumber) * alpha2))]
]
