Class {
	#name : #PMCauchyDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'mu',
		'beta'
	],
	#category : #'Math-Numerical-Math-Distribution'
}

{ #category : #information }
PMCauchyDistribution class >> distributionName [
	
	^'Cauchy distribution'
]

{ #category : #creation }
PMCauchyDistribution class >> fromHistogram: aHistogram [ 
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit."

	^self shape: aHistogram average
		scale: 4 * aHistogram variance 
				/ (Float pi * (aHistogram maximum squared + aHistogram minimum squared)) 
						sqrt
]

{ #category : #creation }
PMCauchyDistribution class >> new [
	"Create an instance of the receiver with center 0 and scale 1."

	^self shape: 0 scale: 1
]

{ #category : #creation }
PMCauchyDistribution class >> shape: aNumber1 scale: aNumber2 [ 
	"Create an instance of the receiver with given center and scale parameters."

	^super new initialize: aNumber1 scale: aNumber2
]

{ #category : #information }
PMCauchyDistribution >> average [
	"Answer the average of the receiver."
	^mu
]

{ #category : #transformation }
PMCauchyDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."
	mu := mu + ( aVector at: 1).
	beta := beta + ( aVector at: 2).
]

{ #category : #information }
PMCauchyDistribution >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber. Assumes that the value of the receiver is 0 for x < 0."
	^(( aNumber - mu) / beta) arcTan / Float pi + (1 / 2)
]

{ #category : #initialization }
PMCauchyDistribution >> initialize: aNumber1 scale: aNumber2 [
	"Private - Initialize the parameters of the receiver. "
	mu := aNumber1.
	beta := aNumber2.
	^self
]

{ #category : #information }
PMCauchyDistribution >> parameters [
		
	^Array with: mu with: beta
]

{ #category : #information }
PMCauchyDistribution >> privateInverseDistributionValue: aNumber [
	"Private - Answer the number whose acceptance is aNumber."
	^aNumber =0 
		ifTrue:[Float infinity negated] 
		ifFalse: [aNumber =1 
			ifTrue:[Float infinity ] 
			ifFalse:[( ( aNumber - (1 / 2)) * Float pi) tan * beta + mu]].
]

{ #category : #information }
PMCauchyDistribution >> standardDeviation [
	"The standard deviation of the receiver is not defined."
	^nil
]

{ #category : #information }
PMCauchyDistribution >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^beta / ( Float pi * ( beta squared + ( aNumber - mu) squared))
]

{ #category : #information }
PMCauchyDistribution >> valueAndGradient: aNumber [
	"Answers an Array containing the value of the receiver at aNumber and the gradient of the receiver's respective to the receiver's parameters evaluated at aNumber."
	| dp denominator |
	dp := self value: aNumber.
	denominator := 1 / ( ( aNumber - mu) squared + beta squared).
	^Array with: dp
		   with: ( PMVector with: 2 * dp * ( aNumber - mu) * denominator
							 with: dp * ( 1 / beta - ( 2 * beta * denominator)))
]

{ #category : #information }
PMCauchyDistribution >> variance [
	"The variance of the receiver is not defined."
	^nil
]
