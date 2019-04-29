Class {
	#name : #PMWeibullDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'alpha',
		'beta',
		'norm'
	],
	#category : #'Math-DHB-Numerical'
}

{ #category : #information }
PMWeibullDistribution class >> distributionName [
	^'Weibull distribution'
]

{ #category : #creation }
PMWeibullDistribution class >> fromHistogram: aHistogram [
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit."
	| average xMin xMax accMin accMax |
	aHistogram minimum < 0
		ifTrue: [ ^nil].
	average := aHistogram average.
	xMin := ( aHistogram minimum + average) / 2.
	accMin := ( aHistogram countsUpTo: xMin) / aHistogram totalCount.
	xMax := ( aHistogram maximum + average) / 2.
	accMax := ( aHistogram countsUpTo: xMax) / aHistogram totalCount.
	^[self solve: xMin acc: accMin upper: xMax acc: accMax]
			on: Error do: [ :signal | signal return: nil]
]

{ #category : #creation }
PMWeibullDistribution class >> new [
		"Prevent using this message to create instances"
	^self error: 'Illegal creation message for this class'
]

{ #category : #creation }
PMWeibullDistribution class >> shape: aNumber1 scale: aNumber2 [ 
	"Create an instance of the receiver with given shape and scale parameters."

	^super new initialize: aNumber1 scale: aNumber2
]

{ #category : #creation }
PMWeibullDistribution class >> solve: lowX acc: lowAcc upper: highX acc: highAcc [ 
	"Private"

	| lowLnAcc highLnAcc deltaLnAcc lowLnX highLnX |
	lowLnAcc := (1 - lowAcc) ln negated ln.
	highLnAcc := (1 - highAcc) ln negated ln.
	deltaLnAcc := highLnAcc - lowLnAcc.
	lowLnX := lowX ln.
	highLnX := highX ln.
	^self shape: deltaLnAcc / (highLnX - lowLnX)
		scale: ((highLnAcc * lowLnX - (lowLnAcc * highLnX)) / deltaLnAcc) exp
]

{ #category : #information }
PMWeibullDistribution >> average [
		"Answer the average of the receiver."
	^(1 / alpha) gamma * beta / alpha
]

{ #category : #transformation }
PMWeibullDistribution >> changeParametersBy: aVector [
		"Modify the parameters of the receiver by aVector."
	alpha := alpha + ( aVector at: 1).
	beta := beta + ( aVector at: 2).
	self computeNorm.
]

{ #category : #initialization }
PMWeibullDistribution >> computeNorm [
		"Private - Compute the norm of the receiver because its parameters have changed."
	norm := alpha/ ( beta raisedTo: alpha).
]

{ #category : #information }
PMWeibullDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 Assumes that the value of the receiver is 0 for x < 0."
	^aNumber > 0
		ifTrue: [ 1 - ( ( ( aNumber / beta) raisedTo: alpha) negated exp)]
		ifFalse:[ 0]
]

{ #category : #initialization }
PMWeibullDistribution >> initialize: aNumber1 scale: aNumber2 [
		"Private - Initialize the parameters of the receiver."
	( aNumber1 > 0 and: [ aNumber2 > 0])
		ifFalse: [ self error: 'Illegal distribution parameters'].
	alpha := aNumber1.
	beta := aNumber2.
	self computeNorm
]

{ #category : #information }
PMWeibullDistribution >> parameters [
	^Array with: alpha with: beta
]

{ #category : #initialization }
PMWeibullDistribution >> privateInverseDistributionValue: aNumber [
		"Private"
	^( (1 - aNumber) ln negated raisedTo: ( 1 / alpha)) * beta
]

{ #category : #information }
PMWeibullDistribution >> value: aNumber [
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^( ( aNumber / beta) raisedTo: alpha) negated exp * ( aNumber raisedTo: ( alpha - 1)) * norm
]

{ #category : #information }
PMWeibullDistribution >> variance [
		"Answer the variance of the receiver.
		 NOTE: At least one of the methods variance or standardDeviation must be implemented by the subclass."
	^( beta squared / alpha) * ( (2 / alpha) gamma * 2 - ( (1 / alpha ) gamma squared / alpha))
]
