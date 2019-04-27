Class {
	#name : #PMLaplaceDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'mu',
		'beta'
	],
	#category : #'Math-DHB-Numerical-Math-Distribution'
}

{ #category : #information }
PMLaplaceDistribution class >> distributionName [
	^'Laplace distribution'
]

{ #category : #creation }
PMLaplaceDistribution class >> fromHistogram: aHistogram [ 
	"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit."

	^self shape: aHistogram average scale: (aHistogram variance / 2) sqrt
]

{ #category : #'instance creation' }
PMLaplaceDistribution class >> new [
	^ self shape: 0 scale: 1
]

{ #category : #creation }
PMLaplaceDistribution class >> shape: aNumber1 scale: aNumber2 [
	^ super new initialize: aNumber1 scale: aNumber2
]

{ #category : #information }
PMLaplaceDistribution >> average [
	^ mu
]

{ #category : #transformation }
PMLaplaceDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."

	mu := mu + (aVector at: 1).
	beta := beta + (aVector at: 2)
]

{ #category : #initialization }
PMLaplaceDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."
	^aNumber > mu
		ifTrue: [ 1 - ( ( ( aNumber - mu) / beta) negated exp / 2)]
		ifFalse:[ ( ( ( aNumber - mu) / beta) exp / 2)]
]

{ #category : #initialization }
PMLaplaceDistribution >> initialize: aNumber1 scale: aNumber2 [
	"Private - Initialize the parameters of the receiver."

	mu := aNumber1.
	beta := aNumber2
]

{ #category : #information }
PMLaplaceDistribution >> kurtosis [
		"Answer the kurtosis of the receiver."
	^3
]

{ #category : #information }
PMLaplaceDistribution >> parameters [
	^ Array with: mu with: beta
]

{ #category : #information }
PMLaplaceDistribution >> random [
	"Answer a random number distributed accroding to the receiver."
	| r |
	r := flatGenerator floatValue ln * beta negated.
	^ flatGenerator floatValue > 0.5
		ifTrue: [ mu + r]
		ifFalse:[ mu - r]
]

{ #category : #information }
PMLaplaceDistribution >> skewness [
		"Answer the skewness of the receiver."
	^0
]

{ #category : #information }
PMLaplaceDistribution >> standardDeviation [
	"Answer the standard deviation of the receiver."

	^ beta * 2 sqrt
]

{ #category : #information }
PMLaplaceDistribution >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."

	^ ((aNumber - mu) / beta) abs negated exp / (2 * beta)
]

{ #category : #information }
PMLaplaceDistribution >> valueAndGradient: aNumber [
	"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber."

	| dp |
	dp := self value: aNumber.
	^ Array with: dp with: (PMVector with: (aNumber - mu) sign * dp / beta with: ((aNumber - mu) abs / beta - 1) * dp / beta)
]
