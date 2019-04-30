Class {
	#name : #PMUniformDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'lowLimit',
		'highLimit'
	],
	#category : #'Math-Numerical'
}

{ #category : #public }
PMUniformDistribution class >> distributionName [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	^'Uniform distribution'
]

{ #category : #public }
PMUniformDistribution class >> from: aNumber1 to: aNumber2 [
		"Create a new instance of the receiver with given limits.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^super new initialize: aNumber1 to: aNumber2
]

{ #category : #public }
PMUniformDistribution class >> fromHistogram: aHistogram [
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit.
		 Default returns nil (must be implemented by subclass).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	| b c|
	b := aHistogram standardDeviation * 1.73205080756888 "12 sqrt / 2".
	b = 0
		ifTrue: [ ^nil].
	c := aHistogram average.
	^self from: ( c - b) to: ( c + b).
]

{ #category : #public }
PMUniformDistribution class >> new [
		"Create a new instance of the receiver with limits 0 and 1.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^self from: 0 to: 1
]

{ #category : #information }
PMUniformDistribution >> average [
		"Answer the average of the receiver."
	^( highLimit + lowLimit) / 2
]

{ #category : #transformation }
PMUniformDistribution >> changeParametersBy: aVector [
		"Modify the parameters of the receiver by aVector."
	lowLimit := lowLimit + ( aVector at: 1).
	highLimit := highLimit + ( aVector at: 2)
]

{ #category : #information }
PMUniformDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."
	aNumber < lowLimit
		ifTrue: [ ^0].
	^aNumber < highLimit
		ifTrue: [ (aNumber - lowLimit) / ( highLimit - lowLimit)]
		ifFalse:[ 1]
]

{ #category : #initialization }
PMUniformDistribution >> initialize: aNumber1 to: aNumber2 [
		"Private - Defines the limits of the receiver."
	aNumber1 < aNumber2
		ifFalse: [ self error: 'Illegal distribution parameters'].
	lowLimit := aNumber1.
	highLimit := aNumber2.
	^self
]

{ #category : #information }
PMUniformDistribution >> kurtosis [
		"Answer the kurtosis of the receiver."
	^-12 / 10
]

{ #category : #information }
PMUniformDistribution >> parameters [
	^Array with: lowLimit with: highLimit
]

{ #category : #information }
PMUniformDistribution >> privateInverseDistributionValue: aNumber [
		"Private"
	^(highLimit - lowLimit) * aNumber + lowLimit
]

{ #category : #information }
PMUniformDistribution >> skewness [
		"Answer the skewness of the receiver."
	^0
]

{ #category : #information }
PMUniformDistribution >> standardDeviation [
		"Answer the standard deviation of the receiver."
	^( highLimit - lowLimit) / 3.46410161513775 "12 sqrt"
]

{ #category : #information }
PMUniformDistribution >> value: aNumber [
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^( aNumber between: lowLimit and: highLimit)
		ifTrue: [ 1/( highLimit - lowLimit)]
		ifFalse:[ 0]
]

{ #category : #information }
PMUniformDistribution >> variance [
		"Answer the variance of the receiver."
	^( highLimit - lowLimit) squared / 12
]
