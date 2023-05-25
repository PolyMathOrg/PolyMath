Class {
	#name : #PMTriangularDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'lowLimit',
		'highLimit',
		'peak'
	],
	#category : #'Math-Distributions'
}

{ #category : #information }
PMTriangularDistribution class >> distributionName [
	^ 'Triangular distribution'
]

{ #category : #creation }
PMTriangularDistribution class >> fromHistogram: aHistogram [
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit."
	| b c|
	b := aHistogram standardDeviation * 1.73205080756888 "12 sqrt / 2".
	b = 0
		ifTrue: [ ^nil].
	c := aHistogram average.
	^self new: c from: ( c - b) to: ( c + b)
]

{ #category : #creation }
PMTriangularDistribution class >> new [
		"Create an instance of the receiver with peak at 1/2 and limits 0 and 1."
	^self new: (1 / 2) from: 0 to: 1
]

{ #category : #creation }
PMTriangularDistribution class >> new: aNumber1 from: aNumber2 to: aNumber3 [
		"Create an instance of the receiver with peak at aNumber1 and limits aNumber2 and aNumber3."
	^super new initialize: aNumber1 from: aNumber2 to: aNumber3
]

{ #category : #information }
PMTriangularDistribution >> average [
		"Answer the average of the receiver."
	^(lowLimit + peak + highLimit) / 3
]

{ #category : #transformation }
PMTriangularDistribution >> changeParametersBy: aVector [
		"Modify the parameters of the receiver by aVector."
	lowLimit := lowLimit + ( aVector at: 1).
	highLimit := highLimit + ( aVector at: 2).
	peak := peak + ( aVector at: 3)
]

{ #category : #information }
PMTriangularDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."
		"changed last line so that 1 is returned, if aNumber >highLimit "
	| norm |
	^( aNumber between: lowLimit and: highLimit)
		ifTrue: [ aNumber < peak
						ifTrue: [ norm := ( highLimit - lowLimit) * ( peak - lowLimit).
									 ( aNumber - lowLimit) squared / norm
									]
						ifFalse:[ aNumber > peak
										ifTrue: [ norm := ( highLimit - lowLimit) * ( highLimit - peak).
									  				 1 - ( ( highLimit - aNumber) squared / norm)
													]
										ifFalse:[ ( peak - lowLimit) / ( highLimit - lowLimit)]
									]
				   ]
		ifFalse:[ aNumber >lowLimit ifTrue: [1] ifFalse: [0]]
]

{ #category : #initialization }
PMTriangularDistribution >> initialize: aNumber1 from: aNumber2 to: aNumber3 [
		"Private - Defines the parameters of the receiver."
	( aNumber2 < aNumber3 and: [ aNumber1 between: aNumber2 and: aNumber3])
		ifFalse: [ self error: 'Illegal distribution parameters'].
	peak := aNumber1.
	lowLimit := aNumber2.
	highLimit := aNumber3
]

{ #category : #information }
PMTriangularDistribution >> inverseAcceptanceAfterPeak: aNumber [
		"Private - Compute inverse acceptance function in the region after the peak."
	^ highLimit - ( ( ( 1 - aNumber) * ( highLimit - lowLimit) * ( highLimit - peak)) sqrt)
]

{ #category : #information }
PMTriangularDistribution >> inverseAcceptanceBeforePeak: aNumber [
		"Private - Compute inverse acceptance function in the region before the peak."
	^ ( aNumber * ( highLimit - lowLimit) * ( peak - lowLimit)) sqrt + lowLimit
]

{ #category : #information }
PMTriangularDistribution >> kurtosis [
		"Answer the kurtosis of the receiver."
	^(-6/10)
]

{ #category : #information }
PMTriangularDistribution >> parameters [
	^Array with: lowLimit with: highLimit with: peak
]

{ #category : #information }
PMTriangularDistribution >> privateInverseDistributionValue: aNumber [
		"Private - Answer the number whose acceptance is aNumber."
	^( peak - lowLimit) / ( highLimit - lowLimit) > aNumber
			ifTrue: [ self inverseAcceptanceBeforePeak: aNumber]
			ifFalse: [ self inverseAcceptanceAfterPeak: aNumber]
]

{ #category : #information }
PMTriangularDistribution >> skewness [
		"Answer the skewness of the receiver."
	^(((lowLimit squared * lowLimit + ( peak squared * peak) + ( highLimit squared * highLimit) ) / 135)
	-(((lowLimit squared * peak) + (lowLimit squared * highLimit) + (peak squared * lowLimit) + (peak squared * highLimit) + (highLimit squared * lowLimit) + (highLimit squared * peak))/90)
	+( 2 * lowLimit * peak * highLimit / 45)) / ( self standardDeviation raisedToInteger: 3)
]

{ #category : #information }
PMTriangularDistribution >> value: aNumber [
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	| norm |
	^( aNumber between: lowLimit and: highLimit)
		ifTrue: [ aNumber < peak
						ifTrue: [ norm := ( highLimit - lowLimit) * ( peak - lowLimit).
									 2 * ( aNumber - lowLimit) / norm
									]
						ifFalse:[ aNumber > peak
										ifTrue: [ norm := ( highLimit - lowLimit) * ( highLimit - peak).
									  				 2 * ( highLimit - aNumber) / norm
													]
										ifFalse:[ 2 / ( highLimit - lowLimit)]
									]
				   ]
		ifFalse:[ 0]
]

{ #category : #information }
PMTriangularDistribution >> variance [
		"Answer the variance of the receiver."
	^(lowLimit squared + peak squared + highLimit squared - ( lowLimit * peak) - ( lowLimit * highLimit) - ( peak * highLimit)) / 18
]
