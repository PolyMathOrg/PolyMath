Class {
	#name : #PMProbabilityDensity,
	#superclass : #Object,
	#instVars : [
		'flatGenerator'
	],
	#category : #'Math-Distributions-Core'
}

{ #category : #information }
PMProbabilityDensity class >> distributionName [
	
	^'Unknown distribution'
]

{ #category : #creation }
PMProbabilityDensity class >> fromHistogram: aHistogram [
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit. Default returns nil (must be implemented by subclass)."
	self flag: #todo. "Why not subclassResponsibility?"
	^ nil
]

{ #category : #information }
PMProbabilityDensity >> acceptanceBetween: aNumber1 and: aNumber2 [
	"Answers the probability of observing a random variable distributed according to the receiver with a value larger than aNumber 1 and lower than or equal to aNumber2. "
	
	^ (self distributionValue: aNumber2) - (self distributionValue: aNumber1)
]

{ #category : #information }
PMProbabilityDensity >> approximatedValueAndGradient: aNumber [
	"Private - gradients an Array containing the value of the receiver at aNumber and the gradient of the receiver's respective to the receiver's parameters evaluated at aNumber.
	 The gradient is computed by approximation."
	| delta parameters dp gradient n |
	parameters := self parameters.
	n := parameters size.
	dp := self value: aNumber.
	delta := Array new: n.
	delta atAllPut: 0.
	gradient := PMVector new: n.
	1 to: n do:
		[ :k |
		  delta at: k put: ( parameters at: k) * 0.0001.
		  self changeParametersBy: delta.
		  gradient at: k put: ( ( ( self value: aNumber) - dp) / ( delta at: k)).
		  delta at: k put: ( delta at: k ) negated.
		  k > 1
			ifTrue: [ delta at: ( k - 1) put: 0].
		].
	self changeParametersBy: delta.
	^Array with: dp with: gradient
]

{ #category : #information }
PMProbabilityDensity >> average [
	"Answer the average of the receiver."
	self subclassResponsibility.
]

{ #category : #transformation }
PMProbabilityDensity >> changeParametersBy: aVector [ 
	self subclassResponsibility
]

{ #category : #creation }
PMProbabilityDensity >> distributionFunction [

	^PMProbabilityDistributionFunction density: self
]

{ #category : #information }
PMProbabilityDensity >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."
	^self subclassResponsibility
]

{ #category : #accessing }
PMProbabilityDensity >> flatGenerator: aGenerator [
	"To change the default generator (which by default is flat between 0 and 1).
	aGenerator should know how to answer floatValue."
	
	flatGenerator := aGenerator
]

{ #category : #initialize }
PMProbabilityDensity >> initialize [

	super initialize.
	flatGenerator := PMMitchellMooreGenerator new.
]

{ #category : #information }
PMProbabilityDensity >> inverseDistributionValue: aNumber [
	"Answer the number whose distribution value is aNumber.
	 NOTE: Subclass MUST NOT overwrite this method."
	^(aNumber between: 0 and: 1)
			ifTrue: [ self privateInverseDistributionValue: aNumber]
			ifFalse:[ self error: 'Illegal argument for inverse distribution value']
]

{ #category : #information }
PMProbabilityDensity >> kurtosis [
	"Answer the kurtosis of the receiver.
	Must be implemented by subclass."

	self subclassResponsibility
]

{ #category : #information }
PMProbabilityDensity >> parameters [

	"Returns an Array containing the parameters of the distribution. 
	It is used to print out the distribution and for fitting."

	self subclassResponsibility
]

{ #category : #display }
PMProbabilityDensity >> printOn: aStream [

	| params |
	aStream nextPutAll: self class distributionName.
	(params := self parameters) isNotNil ifTrue: [
		| first |
		first := true.
		aStream nextPut: $(.
		params do: [ :each |
			first
				ifTrue: [ first := false ]
				ifFalse: [ aStream nextPut: $, ].
			aStream space.
			each printOn: aStream ].
		aStream nextPut: $) ]
]

{ #category : #private }
PMProbabilityDensity >> privateInverseDistributionValue: aNumber [
	"Private - Answer the number whose distribution is aNumber.
	NOTE: Subclass may overwrite this method for faster computation."
	^( PMCDFNewtonZeroFinder function: [ :x | ( self distributionValue: x) - aNumber] derivative: self)
		initialValue: self average ; evaluate
]

{ #category : #information }
PMProbabilityDensity >> random [
	"Answer a random number distributed according to the receiver."
	^self privateInverseDistributionValue: flatGenerator floatValue
]

{ #category : #information }
PMProbabilityDensity >> skewness [
	"Answer the skewness of the receiver.
	 Must be implemented by subclass."

	self subclassResponsibility
]

{ #category : #information }
PMProbabilityDensity >> standardDeviation [
	"Answer the standard deviation of the receiver.
	NOTE: At least one of the methods variance or standardDeviation must be implemented by the subclass."
	^self variance sqrt
]

{ #category : #information }
PMProbabilityDensity >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver
	gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	self subclassResponsibility
]

{ #category : #information }
PMProbabilityDensity >> valueAndGradient: aNumber [
	"Answers an Array containing the value of the receiver at aNumber
	 and the gradient of the receiver's respective to the receiver's
	 parameters evaluated at aNumber."
	^self approximatedValueAndGradient: aNumber
]

{ #category : #information }
PMProbabilityDensity >> variance [
	"Answer the variance of the receiver.
	NOTE: At least one of the methods variance or standardDeviation must be implemented by the subclass."
	^self standardDeviation squared
]
