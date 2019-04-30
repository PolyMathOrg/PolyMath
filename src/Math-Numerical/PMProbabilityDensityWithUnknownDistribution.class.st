Class {
	#name : #PMProbabilityDensityWithUnknownDistribution,
	#superclass : #PMProbabilityDensity,
	#category : #'Math-Numerical'
}

{ #category : #information }
PMProbabilityDensityWithUnknownDistribution >> acceptanceBetween: aNumber1 and: aNumber2 [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value larger than aNumber 1 and lower than or equal to aNumber2."
	^( PMRombergIntegrator function: [:x| self value:x] from: aNumber1 to: aNumber2) evaluate
]

{ #category : #information }
PMProbabilityDensityWithUnknownDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 This general purpose routine uses numerical integration."
	^( PMRombergIntegrator function: [:x| self value:x] from: self lowestValue to: aNumber) evaluate
]

{ #category : #information }
PMProbabilityDensityWithUnknownDistribution >> lowestValue [
	^0
]
