Class {
	#name : #PMIncompleteGammaFunction,
	#superclass : #Object,
	#instVars : [
		'alpha',
		'alphaLogGamma',
		'series',
		'fraction'
	],
	#category : 'Math-DistributionGamma'
}

{ #category : #creation }
PMIncompleteGammaFunction class >> shape: aNumber [
	"Defines a new instance of the receiver with paramater aNumber"
	^super new initialize: aNumber
]

{ #category : #private }
PMIncompleteGammaFunction >> evaluateFraction: aNumber [ 

	fraction isNil 
		ifTrue: 
			[fraction := PMIncompleteGammaFractionTermServer new.
			fraction setParameter: alpha].
	fraction setArgument: aNumber.
	^(PMContinuedFraction server: fraction)
		desiredPrecision: PMFloatingPointMachine new defaultNumericalPrecision;
		evaluate
]

{ #category : #private }
PMIncompleteGammaFunction >> evaluateSeries: aNumber [

	series isNil
		ifTrue: [ series := PMIncompleteGammaSeriesTermServer new.
				  series setParameter: alpha.
				].
	series setArgument: aNumber.
	^(PMInfiniteSeries server: series)
		desiredPrecision: PMFloatingPointMachine new defaultNumericalPrecision;
		evaluate
]

{ #category : #initialization }
PMIncompleteGammaFunction >> initialize: aNumber [
	
	alpha := aNumber asFloat.
	alphaLogGamma := alpha logGamma.
	^self
]

{ #category : #information }
PMIncompleteGammaFunction >> value: aNumber [

	| x norm |
	aNumber = 0
		ifTrue: [ ^0].
	x := aNumber asFloat.
	norm := [ ( x ln * alpha - x - alphaLogGamma) exp] on: Error do: [ :signal | signal return: nil].
	norm isNil
		ifTrue: [ ^1].
	^x - 1 < alpha
		ifTrue: [ ( self evaluateSeries: x) * norm]
		ifFalse:[ 1 - ( norm / ( self evaluateFraction: x))]
]
