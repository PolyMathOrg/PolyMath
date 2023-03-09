Class {
	#name : #PMBetaDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'alpha1',
		'alpha2',
		'gamma1',
		'gamma2',
		'logNorm',
		'incompleteBetaFunction'
	],
	#category : #'Math-Distributions-Beta'
}

{ #category : #information }
PMBetaDistribution class >> distributionName [

	^'Beta distribution'
]

{ #category : #creation }
PMBetaDistribution class >> fromHistogram: aHistogram [ 
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit."

	| average variance a b |
	(aHistogram minimum < 0 or: [aHistogram maximum > 1])
		ifTrue: [^nil].
	average := aHistogram average.
	variance := aHistogram variance.
	a := 1 - average / variance - 1 * average.
	a > 0 ifFalse: [^nil].
	b := 1 / average - 1 * a.
	b > 0 ifFalse: [^nil].
	^self shape: a shape: b
]

{ #category : #creation }
PMBetaDistribution class >> new [

	^self error: 'Illegal creation message for this class'
]

{ #category : #creation }
PMBetaDistribution class >> shape: aNumber1 shape: aNumber2 [ 
	"Create an instance of the receiver with given shape parameters."

	^super new initialize: aNumber1 shape: aNumber2
]

{ #category : #information }
PMBetaDistribution >> average [
	"Answer the average of the receiver."
	^ alpha1 / ( alpha1 + alpha2)
]

{ #category : #transformation }
PMBetaDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."
	alpha1 := alpha1 + ( aVector at: 1).
	alpha2 := alpha2 + ( aVector at: 2).
	self computeNorm.
	gamma1 := nil.
	gamma2 := nil.
	incompleteBetaFunction := nil.
]

{ #category : #private }
PMBetaDistribution >> computeNorm [
	"Compute the norm of the receiver because its parameters have changed."
		 
	logNorm := (alpha1 + alpha2) logGamma - alpha1 logGamma - alpha2 logGamma.
]

{ #category : #information }
PMBetaDistribution >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."

	incompleteBetaFunction ifNil: [ incompleteBetaFunction := PMIncompleteBetaFunction shape: alpha1 shape: alpha2 ].
	^ aNumber <= 0.0
		  ifTrue: [ 0 ]
		  ifFalse: [
			  aNumber >= 1.0
				  ifTrue: [ 1 ]
				  ifFalse: [ incompleteBetaFunction value: aNumber ] ]
]

{ #category : #information }
PMBetaDistribution >> firstGammaDistribution [

	gamma1 ifNil: [ gamma1 := PMGammaDistribution shape: alpha1 scale: 1 ].
	^ gamma1
]

{ #category : #initialization }
PMBetaDistribution >> initialize: aNumber1 shape: aNumber2 [ 

	(aNumber1 > 0 and: [aNumber2 > 0]) 
		ifFalse: [self error: 'Illegal distribution parameters'].
	alpha1 := aNumber1.
	alpha2 := aNumber2.
	self computeNorm.
	^self
]

{ #category : #information }
PMBetaDistribution >> kurtosis [

	^3 * ( alpha1 + alpha2 + 1) * ( (alpha1 + alpha2) squared * 2 + ( ( alpha1 + alpha2 - 6) * alpha1 * alpha2)
			/ ( ( alpha1 + alpha2 + 2) * ( alpha1 + alpha2 + 3) * alpha1 * alpha2)) - 3
]

{ #category : #information }
PMBetaDistribution >> parameters [

	^Array with: alpha1 with: alpha2
]

{ #category : #information }
PMBetaDistribution >> random [
	"Answer a random number distributed according to the receiver."
	| r |
	r := self firstGammaDistribution random.
	^r / ( self secondGammaDistribution random + r)
]

{ #category : #information }
PMBetaDistribution >> secondGammaDistribution [

	gamma2 ifNil: [ gamma2 := PMGammaDistribution shape: alpha2 scale: 1 ].
	^ gamma2
]

{ #category : #information }
PMBetaDistribution >> skewness [

	^( alpha1 + alpha2 + 1) sqrt * 2 * ( alpha2 - alpha1) / ( ( alpha1 * alpha2) sqrt * ( alpha1 + alpha2 + 2))
]

{ #category : #information }
PMBetaDistribution >> value: aNumber [ 
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."

	^(aNumber > 0 and: [ aNumber < 1]) 
		ifTrue: 
			[( ( aNumber ln * (alpha1 - 1) ) + ( ( 1 - aNumber) ln * ( alpha2 - 1)) + logNorm) exp]
		ifFalse: [0]
]

{ #category : #information }
PMBetaDistribution >> variance [

	^alpha1 * alpha2 / ( ( alpha1 + alpha2) squared * ( alpha1 + alpha2 + 1))
]
