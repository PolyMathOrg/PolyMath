Class {
	#name : #PMFisherSnedecorDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'dof1',
		'dof2',
		'norm',
		'chiSquareDistribution1',
		'chiSquareDistribution2',
		'incompleteBetaFunction'
	],
	#category : #'Math-Distributions-ForHistogram'
}

{ #category : #creation }
PMFisherSnedecorDistribution class >> degreeOfFreedom: anInteger1 degreeOfFreedom: anInteger2 [ 
	"Create a new instance of the receiver with given degrees of freedom."

	^super new initialize: anInteger1 and: anInteger2
]

{ #category : #information }
PMFisherSnedecorDistribution class >> distributionName [

	^'Fisher-Snedecor distribution'
]

{ #category : #creation }
PMFisherSnedecorDistribution class >> fromHistogram: aHistogram [ 
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit."

	| n1 n2 a |
	aHistogram minimum < 0 ifTrue: [^nil].
	n2 := (2 / (1 - (1 / aHistogram average))) rounded.
	n2 > 0 ifFalse: [^nil].
	a := (n2 - 2) * (n2 - 4) * aHistogram variance / (n2 squared * 2).
	n1 := (0.7 * (n2 - 2) / (1 - a)) rounded.
	^n1 > 0 
		ifTrue: [self degreeOfFreedom: n1 degreeOfFreedom: n2]
		ifFalse: [nil]
]

{ #category : #creation }
PMFisherSnedecorDistribution class >> new [
	^self error: 'Illegal creation message for this class'
]

{ #category : #creation }
PMFisherSnedecorDistribution class >> test: aStatisticalMoment1 with: aStatisticalMoment2 [ 
	"Perform a consistency Fisher test (or F-test) on the variances of two statistical moments ( or histograms).	 Answer the probability of passing the test."

	^(self class degreeOfFreedom: aStatisticalMoment1 count
		degreeOfFreedom: aStatisticalMoment2 count) 
			distributionValue: aStatisticalMoment1 variance 
					/ aStatisticalMoment2 variance
]

{ #category : #information }
PMFisherSnedecorDistribution >> average [

	^dof2 > 2
		ifTrue: [ dof2 / ( dof2 - 2)]
		ifFalse:[ nil]
]

{ #category : #transformation }
PMFisherSnedecorDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."
	dof1 := ( dof1 + ( aVector at: 1)) max: 1.
	dof2 := ( dof2 + ( aVector at: 2)) max: 1.
	self computeNorm.
	chiSquareDistribution1 := nil.
	chiSquareDistribution2 := nil.
	incompleteBetaFunction := nil.
]

{ #category : #private }
PMFisherSnedecorDistribution >> computeNorm [
	"Private - Compute the norm of the receiver because its parameters have changed."
	norm := ( dof1 ln * ( dof1 / 2) ) + ( dof2 ln * ( dof2 / 2) )
						- ( ( dof1 / 2) logBeta: ( dof2 / 2) ).
]

{ #category : #information }
PMFisherSnedecorDistribution >> confidenceLevel: aNumber [
	"Answer the probability in percent of finding a value distributed according to the receiver outside of the interval [ 1/aNumber, aNumber]."
	aNumber < 0
		ifTrue: [ self error: 'Confidence level argument must be positive'].
	^( 1- ( self acceptanceBetween: aNumber reciprocal and: aNumber)) * 100
]

{ #category : #information }
PMFisherSnedecorDistribution >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."
	^1 - ( self incompleteBetaFunction value: ( dof2 / ( aNumber * dof1 + dof2)))
]

{ #category : #private }
PMFisherSnedecorDistribution >> incompleteBetaFunction [
	"Private - Answers the incomplete beta function used to compute the symmetric acceptance integral of the receiver. "

	incompleteBetaFunction ifNil: [ incompleteBetaFunction := PMIncompleteBetaFunction shape: dof2 / 2 shape: dof1 / 2 ].
	^ incompleteBetaFunction
]

{ #category : #initialization }
PMFisherSnedecorDistribution >> initialize: anInteger1 and: anInteger2 [
	dof1 := anInteger1.
	dof2 := anInteger2.
	self computeNorm
]

{ #category : #information }
PMFisherSnedecorDistribution >> kurtosis [
	"Answer the kurtosis of the receiver."

	^ dof2 > 8
		ifTrue: [ (dof1 * (5 * dof2 - 22) * (dof1 + dof2 - 2) + ((dof2 - 4) * (dof2 - 2) squared)) * 12
				/ (dof1 * (dof2 - 6) * (dof2 - 8) * (dof1 + dof2 - 2)) ]
		ifFalse: [ nil ]
]

{ #category : #information }
PMFisherSnedecorDistribution >> parameters [

	^Array with: dof1 with: dof2
]

{ #category : #information }
PMFisherSnedecorDistribution >> random [
	"Answer a random number distributed according to the receiver."

	chiSquareDistribution1 ifNil: [
		chiSquareDistribution1 := PMChiSquareDistribution degreeOfFreedom: dof1.
		chiSquareDistribution2 := PMChiSquareDistribution degreeOfFreedom: dof2 ].
	^ chiSquareDistribution1 random * dof2 / (chiSquareDistribution2 random * dof1)
]

{ #category : #information }
PMFisherSnedecorDistribution >> skewness [
	"Answer the skewness of the receiver."

	^ dof2 > 6
		ifTrue: [ (2 * dof1 + dof2 - 2) * (8 * (dof2 - 4)) sqrt / ((dof2 - 6) * (dof1 * (dof1 + dof2 - 2)) sqrt) ]
		ifFalse: [ nil ]
]

{ #category : #information }
PMFisherSnedecorDistribution >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^aNumber > 0
		ifTrue: [ ( norm + ( aNumber ln * ( dof1 / 2 - 1) ) - ( (aNumber * dof1 + dof2) ln * ( ( dof1 + dof2) / 2))) exp]
		ifFalse:[ 0]
]

{ #category : #information }
PMFisherSnedecorDistribution >> variance [
	"Answer the variance of the receiver.  Undefined if dof2 is smaller than 5."

	^ dof2 > 4
		ifTrue: [ dof2 squared * 2 * (dof1 + dof2 - 2) / ((dof2 - 2) squared * dof1 * (dof2 - 4)) ]
		ifFalse: [ nil ]
]
