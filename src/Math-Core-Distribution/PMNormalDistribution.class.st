Class {
	#name : #PMNormalDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'mu',
		'sigma'
	],
	#classVars : [
		'NextRandom'
	],
	#category : 'Math-Core-Distribution'
}

{ #category : #information }
PMNormalDistribution class >> distributionName [
	
	^'Normal distribution'
]

{ #category : #creation }
PMNormalDistribution class >> fromHistogram: aHistogram [
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit."

	^ self
		new: aHistogram average
		sigma: aHistogram standardDeviation
]

{ #category : #creation }
PMNormalDistribution class >> new [
	"Create a new instance of the receiver with mu=0 and sigma=1."
	^self new: 0 sigma: 1
]

{ #category : #creation }
PMNormalDistribution class >> new: aNumber1 sigma: aNumber2 [
		"Create a new instance of the receiver with given mu and sigma."
	^super new initialize: aNumber1 sigma: aNumber2
]

{ #category : #information }
PMNormalDistribution class >> random [
	"Answer a random number distributed according to a (0,1) normal distribution."
	| v1 v2 w y |
	NextRandom isNil
		ifTrue: [ [ v1 := Number random * 2 - 1.
					v2 := Number random * 2 - 1.
					w := v1 squared + v2 squared.
					w > 1 ] whileTrue: [].
				  y := ( ( w ln * 2 negated) / w) sqrt.
				v1 := y * v1.
				NextRandom := y * v2.
				]
		ifFalse:[ v1 :=NextRandom.
				  NextRandom := nil.
				].
	^v1
]

{ #category : #information }
PMNormalDistribution >> average [
	"Answer the average of the receiver."
	^mu
]

{ #category : #transformation }
PMNormalDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."
	mu := mu + ( aVector at: 1).
	sigma := sigma + ( aVector at: 2).
]

{ #category : #information }
PMNormalDistribution >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."
	^PMErfApproximation new value: ( ( aNumber - mu) / sigma)
]

{ #category : #initialization }
PMNormalDistribution >> initialize: aNumber1 sigma: aNumber2 [

	mu := aNumber1.
	sigma := aNumber2.
	^self
]

{ #category : #information }
PMNormalDistribution >> kurtosis [
	"Answer the kurtosis of the receiver."
	^0
]

{ #category : #information }
PMNormalDistribution >> parameters [

	^Array with: mu with: sigma
]

{ #category : #information }
PMNormalDistribution >> random [
	"Answer a random number distributed accroding to the receiver."
	^self class random * sigma + mu
]

{ #category : #information }
PMNormalDistribution >> skewness [
	"Answer the skewness of the receiver."
	^0
]

{ #category : #information }
PMNormalDistribution >> standardDeviation [
	"Answer the standard deviation of the receiver."
	^sigma
]

{ #category : #information }
PMNormalDistribution >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	
	^( PMErfApproximation new normal: (aNumber - mu) / sigma) / sigma
]

{ #category : #information }
PMNormalDistribution >> valueAndGradient: aNumber [
	"Answers an Array containing the value of the receiver at aNumber and the gradient of the receiver's respective to the receiver's parameters evaluated at aNumber."
	| dp y |
	y := ( aNumber - mu) / sigma.
	dp := ( PMErfApproximation new normal: y) / sigma.
	^Array with: dp
		   with: ( PMVector with: dp * y / sigma
							 with: dp * ( y squared - 1) / sigma)
]
