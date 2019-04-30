Class {
	#name : #PMProbabilityDistributionFunction,
	#superclass : #Object,
	#instVars : [
		'probabilityDensity'
	],
	#category : #'Math-Numerical'
}

{ #category : #creation }
PMProbabilityDistributionFunction class >> density: aProbabilityDensity [
	^self new initialize: aProbabilityDensity
]

{ #category : #initialization }
PMProbabilityDistributionFunction >> initialize: aProbabilityDensity [
		"Private"
	probabilityDensity := aProbabilityDensity.
	^self
]

{ #category : #information }
PMProbabilityDistributionFunction >> value: aNumber [
	^probabilityDensity distributionValue: aNumber
]
