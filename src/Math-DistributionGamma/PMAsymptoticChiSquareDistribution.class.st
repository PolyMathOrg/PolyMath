Class {
	#name : #PMAsymptoticChiSquareDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'degreeOfFreedom',
		'reducedDOF',
		'normalDistribution'
	],
	#category : 'Math-DistributionGamma'
}

{ #category : #creation }
PMAsymptoticChiSquareDistribution class >> degreeOfFreedom: anInteger [
	^ self basicNew initialize: anInteger
]

{ #category : #information }
PMAsymptoticChiSquareDistribution class >> distributionName [

	^ 'Chi square distribution'
]

{ #category : #creation }
PMAsymptoticChiSquareDistribution class >> new [
	
	^self error: 'Illegal creation message for this class'
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> average [
	"Answer the average of the receiver."

	^ degreeOfFreedom
]

{ #category : #transformation }
PMAsymptoticChiSquareDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."

	normalDistribution changeParametersBy: aVector
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> confidenceLevel: aNumber [
	"Answer the probability in percent of finding a chi square value
		 distributed according to the receiver larger than aNumber."

	^ (1 - (self distributionValue: aNumber)) * 100
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."

	| x |
	^ aNumber > 0
		ifTrue: [ 
			x := (aNumber * 2) sqrt.
			PMErfApproximation new value: x - reducedDOF ]
		ifFalse: [ 0 ]
]

{ #category : #initialization }
PMAsymptoticChiSquareDistribution >> initialize: anInteger [
	"Private"

	degreeOfFreedom := anInteger.
	reducedDOF := (degreeOfFreedom * 2 - 1) sqrt.
	^ self
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> kurtosis [
	"Answer the kurtosis of the receiver."

	^ 12 / degreeOfFreedom
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> parameters [
	"Returns an Array containing the parameters of the distribution.
		 It is used to print out the distribution and for fitting."

	^ Array with: degreeOfFreedom
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> random [
	"Answer a random number distributed accroding to the receiver."

	^ (PMNormalDistribution random + reducedDOF) squared / 2
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> skewness [
	"Answer the skewness of the receiver."

	^ (2 / degreeOfFreedom) sqrt * 2
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."

	| x |
	^ aNumber > 0
		ifTrue: [ 
			x := (aNumber * 2) sqrt.
			(PMErfApproximation new normal: x - reducedDOF) / x ]
		ifFalse: [ 0 ]
]

{ #category : #information }
PMAsymptoticChiSquareDistribution >> variance [
	"Answer the variance of the receiver."

	^ degreeOfFreedom * 2
]
