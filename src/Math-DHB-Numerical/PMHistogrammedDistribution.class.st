Class {
	#name : #PMHistogrammedDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'histogram'
	],
	#category : 'Math-DHB-Numerical'
}

{ #category : #information }
PMHistogrammedDistribution class >> distributionName [
	^'Experimental distribution'
]

{ #category : #creation }
PMHistogrammedDistribution class >> histogram: aHistogram [
		"Create a new instance of the receiver corresponding to a histogram."
	^super new initialize: aHistogram
]

{ #category : #creation }
PMHistogrammedDistribution class >> new [
		"Prevent using this message to create instances"
	^self error: 'Illegal creation message for this class'
]

{ #category : #information }
PMHistogrammedDistribution >> acceptanceBetween: aNumber1 and: aNumber2 [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value larger than aNumber 1 and lower than or equal to aNumber2."
	^( histogram countsBetween: ( aNumber1 max: histogram minimum)
						and: ( aNumber2 min: histogram maximum) ) / histogram totalCount
]

{ #category : #information }
PMHistogrammedDistribution >> average [
		"Answer the average of the receiver."
	^histogram average
]

{ #category : #information }
PMHistogrammedDistribution >> distributionValue: aNumber [
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."
	^aNumber < histogram minimum
		ifTrue: [ 0]
		ifFalse:[ aNumber < histogram maximum
							ifTrue: [ ( histogram countsUpTo: aNumber) / histogram totalCount]
							ifFalse:[ 1]
					]
]

{ #category : #initialization }
PMHistogrammedDistribution >> initialize: aHistogram [
		"Private - Defines the histogram of the receiver."
	aHistogram count = 0
		ifTrue: [ self error: 'Cannot define probability density on an empty histogram'].
	histogram := aHistogram.
	^self
]

{ #category : #information }
PMHistogrammedDistribution >> kurtosis [
		"Answer the kurtosis of the receiver."
	^histogram kurtosis
]

{ #category : #information }
PMHistogrammedDistribution >> parameters [
	^ nil
]

{ #category : #information }
PMHistogrammedDistribution >> privateInverseDistributionValue: aNumber [
		"Private"
	^histogram inverseDistributionValue: aNumber
]

{ #category : #information }
PMHistogrammedDistribution >> skewness [
		"Answer the skewness of the receiver."
	^histogram skewness
]

{ #category : #information }
PMHistogrammedDistribution >> standardDeviation [
		"Answer the standard deviation of the receiver."
	^histogram standardDeviation
]

{ #category : #information }
PMHistogrammedDistribution >> value: aNumber [
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^( aNumber >= histogram minimum and: [ aNumber < histogram maximum])
		ifTrue: [ ( histogram countAt: aNumber) / ( histogram totalCount * histogram binWidth)]
		ifFalse:[ 0]
]

{ #category : #information }
PMHistogrammedDistribution >> variance [
		"Answer the variance of the receiver."
	^histogram variance
]
