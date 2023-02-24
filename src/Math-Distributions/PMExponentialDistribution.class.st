Class {
	#name : #PMExponentialDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'beta'
	],
	#category : #'Math-Distributions'
}

{ #category : #information }
PMExponentialDistribution class >> distributionName [
	^ 'Exponential distribution'
]

{ #category : #creation }
PMExponentialDistribution class >> fromHistogram: aHistogram [
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit."
	| mu |
	aHistogram minimum < 0
		ifTrue: [ ^nil].
	mu := aHistogram average.
	^mu > 0 ifTrue: [ self scale: aHistogram average]
			ifFalse:[ nil]
]

{ #category : #creation }
PMExponentialDistribution class >> new [
		"Create a new instance of the receiver with scale parameter 1."
	^super new initialize: 1
]

{ #category : #creation }
PMExponentialDistribution class >> scale: aNumber [
		"Create a new instance of the receiver with given scale parameter."
	^super new initialize: aNumber
]

{ #category : #information }
PMExponentialDistribution >> average [
	"Answer the average of the receiver."

	^ beta
]

{ #category : #transformation }
PMExponentialDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."

	beta := beta + (aVector at: 1)
]

{ #category : #information }
PMExponentialDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."

	^[1 - ( ( aNumber / beta negated) exp)]
			on: Error do: [ :signal | signal return: 0]
]

{ #category : #initialization }
PMExponentialDistribution >> initialize: aNumber [
	"Private - Set the scale parameter of the receiver to aNumber."

	aNumber > 0
		ifFalse: [ self error: 'Illegal distribution parameters' ].
	beta := aNumber
]

{ #category : #information }
PMExponentialDistribution >> kurtosis [
		"Answer the kurtosis of the receiver."
	^6
]

{ #category : #information }
PMExponentialDistribution >> parameters [
	^ Array with: beta
]

{ #category : #information }
PMExponentialDistribution >> privateInverseDistributionValue: aNumber [
		"Private - Answer the number whose acceptance is aNumber."
	^(1 - aNumber) ln negated * beta
]

{ #category : #information }
PMExponentialDistribution >> random [
	"Answer a random number distributed according to the receiver."
	^ flatGenerator floatValue ln * beta negated
]

{ #category : #information }
PMExponentialDistribution >> skewness [
		"Answer the skewness of the receiver."
	^2
]

{ #category : #information }
PMExponentialDistribution >> standardDeviation [
	"Answer the standard deviation of the receiver."

	^ beta
]

{ #category : #information }
PMExponentialDistribution >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."

	^ [ (aNumber / beta) negated exp / beta ]
		on: Error
		do: [ :signal | signal return: 0 ]
]

{ #category : #information }
PMExponentialDistribution >> valueAndGradient: aNumber [
	"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber."

	| dp |
	dp := self value: aNumber.
	^ Array with: dp with: (PMVector with: (aNumber / beta - 1) * dp / beta)
]
