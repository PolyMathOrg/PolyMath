Class {
	#name : #PMScaledProbabilityDensityFunction,
	#superclass : #Object,
	#instVars : [
		'probabilityDensityFunction',
		'count',
		'binWidth'
	],
	#category : #'Math-Numerical'
}

{ #category : #creation }
PMScaledProbabilityDensityFunction class >> histogram: aHistogram against: aProbabilityDensityFunction [
	"Create a new instance of the receiver with given probability density function and histogram."
		^self new
		initialize: aProbabilityDensityFunction
		binWidth: aHistogram binWidth
		count: aHistogram totalCount
]

{ #category : #creation }
PMScaledProbabilityDensityFunction class >> histogram: aHistogram distributionClass: aProbabilityDensityFunctionClass [
	"Create a new instance of the receiver with given probability density function and histogram."

	| dp |
	^ (dp := aProbabilityDensityFunctionClass fromHistogram: aHistogram) ifNotNil: [ self histogram: aHistogram against: dp ]
]

{ #category : #transformation }
PMScaledProbabilityDensityFunction >> changeParametersBy: aVector [
		"Modify the parameters of the receiver by aVector"
	count := count + aVector last.
	probabilityDensityFunction changeParametersBy: aVector
]

{ #category : #information }
PMScaledProbabilityDensityFunction >> distributionFunction [
	^probabilityDensityFunction distributionFunction
]

{ #category : #initialization }
PMScaledProbabilityDensityFunction >> initialize: aProbabilityDensityFunction binWidth: aNumber count: anInteger [
	"Private"

	probabilityDensityFunction := aProbabilityDensityFunction.
	binWidth := aNumber.
	count := anInteger.
	^self
]

{ #category : #information }
PMScaledProbabilityDensityFunction >> parameters [
	^probabilityDensityFunction parameters copyWith: count
]

{ #category : #display }
PMScaledProbabilityDensityFunction >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $[;
			nextPutAll: probabilityDensityFunction class distributionName;
			nextPut: $]
]

{ #category : #transformation }
PMScaledProbabilityDensityFunction >> setCount: aNumber [
	count := aNumber
]

{ #category : #information }
PMScaledProbabilityDensityFunction >> value: aNumber [

	^(probabilityDensityFunction value: aNumber) * binWidth * count
]

{ #category : #information }
PMScaledProbabilityDensityFunction >> valueAndGradient: aNumber [
	"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber."

	| g temp |
	g := probabilityDensityFunction valueAndGradient: aNumber.
	temp := binWidth * count.
	^Array with: g first * temp
		   with: ( (g last collect: [:each | each * temp]) copyWith: g first * binWidth)
]
