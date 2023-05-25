Class {
	#name : #PMLogNormalDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'normalDistribution'
	],
	#category : #'Math-Distributions-Normal'
}

{ #category : #information }
PMLogNormalDistribution class >> distributionName [
	^ 'Log normal distribution'
]

{ #category : #creation }
PMLogNormalDistribution class >> fromHistogram: aHistogram [
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit."
	| average variance sigma2 |
	aHistogram minimum < 0
		ifTrue: [ ^nil].
	average := aHistogram average.
	average > 0
		ifFalse: [ ^nil].
	variance := aHistogram variance.
	sigma2 := ( variance / average squared + 1) ln.
	sigma2 > 0
		ifFalse: [ ^nil].
	^self new: ( average ln - (sigma2 * 0.5)) sigma: sigma2 sqrt
]

{ #category : #creation }
PMLogNormalDistribution class >> new [
		"Create a new instance of the receiver with mu=0 and sigma=1."
	^self new: 0 sigma: 1
]

{ #category : #creation }
PMLogNormalDistribution class >> new: aNumber1 sigma: aNumber2 [
		"Create a new instance of the receiver with given mu and sigma."
	^super new initialize: aNumber1 sigma: aNumber2
]

{ #category : #information }
PMLogNormalDistribution >> acceptanceBetween: aNumber1 and: aNumber2 [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value larger than aNumber 1 and lower than or equal to aNumber2."
	^( PMRombergIntegrator function: [:x| self value:x] from: aNumber1 to: aNumber2) evaluate
]

{ #category : #information }
PMLogNormalDistribution >> average [
		"Answer the average of the receiver."
	^( normalDistribution variance*0.5 + normalDistribution average) exp
]

{ #category : #transformation }
PMLogNormalDistribution >> changeParametersBy: aVector [
		"Modify the parameters of the receiver by aVector."
	normalDistribution changeParametersBy: aVector
]

{ #category : #information }
PMLogNormalDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 This general purpose routine uses numerical integration."
	^( PMRombergIntegrator function: [:x| self value:x] from: self lowestValue to: aNumber) evaluate
]

{ #category : #information }
PMLogNormalDistribution >> fourthCentralMoment [
		"Private"
	| y x |
	y := normalDistribution average exp.
	x := normalDistribution variance exp.
	^( y squared squared) * ( x squared)
		* ( ( ( x squared * x - 4) * ( x squared) + 6) * x - 3)
]

{ #category : #initialization }
PMLogNormalDistribution >> initialize: aNumber1 sigma: aNumber2 [
		"Private - Defines the parameters of the receiver."
	normalDistribution := PMNormalDistribution new: aNumber1 sigma: aNumber2.
	^self
]

{ #category : #information }
PMLogNormalDistribution >> kurtosis [
		"Answer the variance of the receiver."
	| x |
	x := normalDistribution variance exp.
	^( ( x + 2) * x + 3) * ( x squared) - 6
]

{ #category : #information }
PMLogNormalDistribution >> lowestValue [
	^0
]

{ #category : #information }
PMLogNormalDistribution >> parameters [
	^normalDistribution parameters
]

{ #category : #information }
PMLogNormalDistribution >> random [
		"Answer a random number distributed accroding to the receiver."
	^normalDistribution random exp
]

{ #category : #information }
PMLogNormalDistribution >> skewness [
		"Answer the variance of the receiver."
	| x |
	x := normalDistribution variance exp.
	^(x - 1) sqrt * (x + 2)
]

{ #category : #information }
PMLogNormalDistribution >> thirdCentralMoment [
		"Private"
	| y x |
	y := normalDistribution average exp.
	x := normalDistribution variance exp.
	^( y squared * y) * ( x raisedTo: (3/2))
		* ( ( x squared negated + 3) * x - 2)
]

{ #category : #information }
PMLogNormalDistribution >> value: aNumber [
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^aNumber > 0
		ifTrue: [ ( normalDistribution value: aNumber ln) / aNumber]
		ifFalse:[ 0]
]

{ #category : #information }
PMLogNormalDistribution >> variance [
		"Answer the variance of the receiver."
	^( normalDistribution average * 2 + normalDistribution variance) exp * ( normalDistribution variance exp - 1)
]
