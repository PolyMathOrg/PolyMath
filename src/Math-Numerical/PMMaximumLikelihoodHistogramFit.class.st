Class {
	#name : #PMMaximumLikelihoodHistogramFit,
	#superclass : #PMLeastSquareFit,
	#instVars : [
		'count',
		'countVariance'
	],
	#category : #'Math-Numerical'
}

{ #category : #operation }
PMMaximumLikelihoodHistogramFit >> accumulate: aWeightedPoint [
		"Private"
	| f g temp inverseProbability|
	f := result valueAndGradient: aWeightedPoint xValue.
	g := f last copyFrom: 1 to: ( f last size - 1).
	f := f first.
	f = 0 ifTrue: [ ^nil].
	inverseProbability := 1 / f.
	temp := aWeightedPoint yValue * inverseProbability.
	constants accumulate: g * temp.
	temp := temp * inverseProbability.
	1 to: g size do:
		[ :k |
		  ( equations at: k) accumulate: g * ( ( g at: k) * temp).
		]
]

{ #category : #operation }
PMMaximumLikelihoodHistogramFit >> computeChanges [
		"Private"
	^super computeChanges copyWith: 0
]

{ #category : #operation }
PMMaximumLikelihoodHistogramFit >> computeNormalization [
	"Private"

	| numerator denominator temp |
	numerator := 0.
	denominator := 0.
	dataHolder pointsAndErrorsDo: 
			[:each | 
			temp := result value: each xValue.
			temp = 0 
				ifFalse: 
					[numerator := numerator + (each yValue squared / temp).
					denominator := denominator + temp]].
	count := ( numerator / denominator) sqrt.
	countVariance := numerator / ( 4 * count).
]

{ #category : #operation }
PMMaximumLikelihoodHistogramFit >> finalizeIterations [
	"Compute the normalization factor."

	self computeNormalization.
	result setCount: count.
	super finalizeIterations
]

{ #category : #information }
PMMaximumLikelihoodHistogramFit >> fitType [
	^ 'Maximum likelihood fit'
]

{ #category : #operation }
PMMaximumLikelihoodHistogramFit >> initializeIterations [
	result setCount: 1.
	count := dataHolder totalCount.
	super initializeIterations
]

{ #category : #information }
PMMaximumLikelihoodHistogramFit >> normalization [
	^ count
]

{ #category : #information }
PMMaximumLikelihoodHistogramFit >> normalizationError [
	^countVariance sqrt
]

{ #category : #information }
PMMaximumLikelihoodHistogramFit >> numberOfFreeParameters [
		"Private"
	^super numberOfParameters
]

{ #category : #information }
PMMaximumLikelihoodHistogramFit >> numberOfParameters [
		"Private"
	^super numberOfParameters - 1
]

{ #category : #information }
PMMaximumLikelihoodHistogramFit >> valueAndError: aNumber [ 

	| valueGradient gradient gVar |
	valueGradient := result valueAndGradient: aNumber.
	gradient := valueGradient last copyFrom: 1 to: valueGradient last size - 1.
	gVar := gradient * (self errorMatrix * gradient) / count.
	^Array with: valueGradient first
		with: ((valueGradient first / count) squared * countVariance + gVar) sqrt
]
