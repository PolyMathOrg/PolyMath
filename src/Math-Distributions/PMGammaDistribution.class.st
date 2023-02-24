Class {
	#name : #PMGammaDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'alpha',
		'beta',
		'norm',
		'randomCoefficients',
		'incompleteGammaFunction'
	],
	#category : #'Math-Distributions-Gamma'
}

{ #category : #information }
PMGammaDistribution class >> distributionName [

	^'Gamma distribution'
]

{ #category : #creation }
PMGammaDistribution class >> fromHistogram: aHistogram [
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit."
	| alpha beta |
	aHistogram minimum < 0
		ifTrue: [ ^nil].
	alpha := aHistogram average.
	beta := aHistogram variance / alpha.
	^[ self shape: alpha / beta scale: beta] on: Error do: [ :signal | signal return: nil]
]

{ #category : #creation }
PMGammaDistribution class >> new [

	^self error: 'Illegal creation message for this class'
]

{ #category : #creation }
PMGammaDistribution class >> shape: aNumber1 scale: aNumber2 [
	"Create an instance of the receiver with given shape and scale parameters."
	^super new initialize: aNumber1 scale: aNumber2
]

{ #category : #information }
PMGammaDistribution >> average [
	"Answer the average of the receiver."
	^ alpha * beta
]

{ #category : #transformation }
PMGammaDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."
	alpha := alpha + ( aVector at: 1).
	beta := beta + ( aVector at: 2).
	self computeNorm.
	incompleteGammaFunction := nil.
	randomCoefficients := nil.
]

{ #category : #initialization }
PMGammaDistribution >> computeNorm [
	"Private - Compute the norm of the receiver because its parameters have changed."
	norm := beta ln * alpha + alpha logGamma.
]

{ #category : #information }
PMGammaDistribution >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to
	the receiver with a value lower than or equal to aNumber."
	^ self incompleteGammaFunction value: aNumber / beta
]

{ #category : #information }
PMGammaDistribution >> incompleteGammaFunction [
	"Private"

	incompleteGammaFunction isNil 
		ifTrue: 
			[incompleteGammaFunction := PMIncompleteGammaFunction shape: alpha].
	^incompleteGammaFunction
]

{ #category : #initialization }
PMGammaDistribution >> initialize: aNumber1 scale: aNumber2 [
	"Private - Initialize the parameters of the receiver."
	( aNumber1 > 0 and: [ aNumber2 > 0])
		ifFalse: [ self error: 'Illegal distribution parameters'].
	alpha := aNumber1.
	beta := aNumber2.
	self computeNorm.
	^self
]

{ #category : #information }
PMGammaDistribution >> initializeRandomCoefficientsForLargeAlpha [
	"Private"
	| a b q d |
	a := 1 / ( 2 * alpha - 1) sqrt.
	b := alpha - (4 ln).
	q := 1 / a + alpha.
	d := 4.5 ln + 1.
	^Array with: a with: b with: q with: d
]

{ #category : #information }
PMGammaDistribution >> initializeRandomCoefficientsForSmallAlpha [
	"Private"
	| e |
	e := 1 exp.
	^( e + alpha) / e
]

{ #category : #information }
PMGammaDistribution >> kurtosis [
	"Answer the kurtosis of the receiver."
	^6 / alpha
]

{ #category : #information }
PMGammaDistribution >> parameters [

	^Array with: alpha with: beta
]

{ #category : #information }
PMGammaDistribution >> random [
	"Answer a random number distributed accroding to the receiver."
	^( alpha > 1 ifTrue: [ self randomForLargeAlpha]
						ifFalse:[ self randomForSmallAlpha]) * beta
]

{ #category : #information }
PMGammaDistribution >> randomCoefficientsForLargeAlpha [
	"Private"
	randomCoefficients isNil
		ifTrue: [ randomCoefficients := self initializeRandomCoefficientsForLargeAlpha].
	^randomCoefficients
]

{ #category : #information }
PMGammaDistribution >> randomCoefficientsForSmallAlpha [
	"Private"
	randomCoefficients isNil
		ifTrue: [ randomCoefficients := self initializeRandomCoefficientsForSmallAlpha].
	^randomCoefficients
]

{ #category : #information }
PMGammaDistribution >> randomForLargeAlpha [
		"Private - Generate a random number distributed according to the receiver
						when alpha > 1."
	[ true] whileTrue: [
	| u1 u2 c v y z w|
	u1 := flatGenerator floatValue.
	u2 := flatGenerator floatValue.
	c := self randomCoefficientsForLargeAlpha.
	v := ( u1 / ( 1 - u1)) ln * (c at: 1).
	y := v exp * alpha.
	z := u1 squared * u2.
	w := ( c at: 3) * v + ( c at: 2) - y.
	( c at: 4) + w >= ( 4.5 * z) ifTrue: [ ^y].
	z ln <= w ifTrue: [ ^y].
								].
]

{ #category : #information }
PMGammaDistribution >> randomForSmallAlpha [
	"Private - Generate a random number distributed according to the receiver when alpha < 1. "

	[ true ]
		whileTrue: [ 
			| p |
			p := flatGenerator floatValue * self randomCoefficientsForSmallAlpha.
			p > 1
				ifTrue: [ 
					| y |
					y := ((self randomCoefficientsForSmallAlpha - p) / alpha) ln negated.
					flatGenerator floatValue <= (y raisedTo: alpha - 1)
						ifTrue: [ ^ y ] ]
				ifFalse: [ 
					| y |
					y := p raisedTo: 1 / alpha.
					flatGenerator  floatValue <= y negated exp
						ifTrue: [ ^ y ] ] ]
]

{ #category : #information }
PMGammaDistribution >> skewness [
	"Answer the skewness of the receiver."

	^ 2 / alpha sqrt
]

{ #category : #information }
PMGammaDistribution >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."

	^ aNumber > 0
		ifTrue: [ (aNumber ln * (alpha - 1) - (aNumber / beta) - norm) exp ]
		ifFalse: [ 0 ]
]

{ #category : #information }
PMGammaDistribution >> variance [
	"Answer the variance of the receiver."

	^ beta squared * alpha
]
