Class {
	#name : #PMFisherTippettDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'alpha',
		'beta'
	],
	#category : #'Math-Numerical-Math-Distribution'
}

{ #category : #information }
PMFisherTippettDistribution class >> distributionName [
	^ 'Fisher-Tippett distribution'
]

{ #category : #creation }
PMFisherTippettDistribution class >> fromHistogram: aHistogram [
	"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit."

	| beta |
	beta := aHistogram standardDeviation.
	beta = 0
		ifTrue: [ ^ nil ].
	beta := beta * (6 sqrt / Float pi).
	^ self shape: aHistogram average - (0.5772156649 * beta) scale: beta
]

{ #category : #creation }
PMFisherTippettDistribution class >> new [
	"Create a standard version of the receiver."

	^ self shape: 0 scale: 1
]

{ #category : #creation }
PMFisherTippettDistribution class >> shape: aNumber1 scale: aNumber2 [
	"Create an instance of the receiver with given shape and scale parameters."

	^ super new initialize: aNumber1 scale: aNumber2
]

{ #category : #information }
PMFisherTippettDistribution >> average [
		"Answer the average of the receiver."
	^0.577256649 * beta + alpha
]

{ #category : #information }
PMFisherTippettDistribution >> changeParametersBy: aVector [
		"Modify the parameters of the receiver by aVector."
	alpha := alpha + ( aVector at: 1).
	beta := beta + ( aVector at: 2).
]

{ #category : #information }
PMFisherTippettDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."
	| arg |
	arg := ( aNumber - alpha) / beta.
	arg := arg < PMFloatingPointMachine new largestExponentArgument negated
					ifTrue: [ ^0]
					ifFalse:[arg negated exp].
	^arg negated exp
]

{ #category : #initialization }
PMFisherTippettDistribution >> initialize: aNumber1 scale: aNumber2 [
	"Initialize the parameters of the receiver."

	aNumber2 > 0
		ifFalse: [ self error: 'Illegal distribution parameters' ].
	alpha := aNumber1.
	beta := aNumber2
]

{ #category : #information }
PMFisherTippettDistribution >> integralFrom: aNumber1 to: aNumber2 [
		"Private - Compute the integral of the receiver from aNumber1 to aNumber2."
	^( PMRombergIntegrator function: [:x|self value:x] from: aNumber1 to: aNumber2) evaluate
]

{ #category : #information }
PMFisherTippettDistribution >> integralUpTo: aNumber [
		"Private - Compute the integral of the receiver from -infinity to aNumber.
		 aNumber must be below 0 (no checking!)."
	^( PMRombergIntegrator function:
			[ :x | x = 0 ifTrue: [ 0] ifFalse: [ ( self value: 1 / x) / x squared] ]
			from: 1 / aNumber to: 0) evaluate
]

{ #category : #information }
PMFisherTippettDistribution >> kurtosis [
		"Answer the kurtosis of the receiver."
	^2.4
]

{ #category : #information }
PMFisherTippettDistribution >> parameters [
	^Array with: alpha with: beta
]

{ #category : #information }
PMFisherTippettDistribution >> random [
		"Answer a random number distributed according to the receiver."
	| t |
	[ t := flatGenerator floatValue ln negated.
	  t > 0] whileFalse: [].
	^t ln negated * beta + alpha
]

{ #category : #information }
PMFisherTippettDistribution >> skewness [
		"Answer the skewness of the receiver."
	^1.3
]

{ #category : #information }
PMFisherTippettDistribution >> standardDeviation [
		"Answer the standard deviation of the receiver."
	^Float pi * beta / ( 6 sqrt)
]

{ #category : #information }
PMFisherTippettDistribution >> value: aNumber [
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	| arg |
	arg := ( aNumber - alpha) / beta.
	arg := arg > PMFloatingPointMachine new largestExponentArgument ifTrue: [ ^0]
						ifFalse:[arg negated exp + arg].
	^arg > PMFloatingPointMachine new largestExponentArgument ifTrue: [ 0]
						ifFalse:[ arg negated exp / beta]
]

{ #category : #information }
PMFisherTippettDistribution >> valueAndGradient: aNumber [
		"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber."
	| dp dy y|
	dp := self value: aNumber.
	y := ( aNumber - alpha) / beta.
	dy := ( y negated exp - 1).
	^Array with: dp
		   with: ( PMVector with: dy * dp / beta negated
							 with: dp * ( y * dy + 1) / beta negated)
]
