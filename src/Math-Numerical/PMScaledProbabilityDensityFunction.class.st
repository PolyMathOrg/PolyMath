Class {
	#name : #PMScaledProbabilityDensityFunction,
	#superclass : #Object,
	#instVars : [
		'probabilityDensityFunction',
		'count',
		'binWidth'
	],
	#category : #'Math-Numerical'
}

{ #category : #creation }
PMScaledProbabilityDensityFunction class >> histogram: aHistogram against: aProbabilityDensityFunction [ 
	"Create a new instance of the receiver with given probability density function and histogram.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 3/3/99 "
		^self new 
		initialize: aProbabilityDensityFunction
		binWidth: aHistogram binWidth
		count: aHistogram totalCount
]

{ #category : #creation }
PMScaledProbabilityDensityFunction class >> histogram: aHistogram distributionClass: aProbabilityDensityFunctionClass [ 
	"Create a new instance of the receiver with given probability density function and histogram. 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 3/3/99"

	| dp |
	^(dp := aProbabilityDensityFunctionClass fromHistogram: aHistogram) isNil
		ifTrue: [nil]
		ifFalse: [self histogram: aHistogram against: dp]
]

{ #category : #transformation }
PMScaledProbabilityDensityFunction >> changeParametersBy: aVector [
		"Modify the parameters of the receiver by aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/3/99 "
	count := count + aVector last.
	probabilityDensityFunction changeParametersBy: aVector.
]

{ #category : #information }
PMScaledProbabilityDensityFunction >> distributionFunction [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	^probabilityDensityFunction distributionFunction
]

{ #category : #initialization }
PMScaledProbabilityDensityFunction >> initialize: aProbabilityDensityFunction binWidth: aNumber count: anInteger [ 
	"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 3/3/99 "

	probabilityDensityFunction := aProbabilityDensityFunction.
	binWidth := aNumber.
	count := anInteger.
	^self
]

{ #category : #information }
PMScaledProbabilityDensityFunction >> parameters [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/3/99 "
	^probabilityDensityFunction parameters copyWith: count
]

{ #category : #display }
PMScaledProbabilityDensityFunction >> printOn: aStream [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	super printOn: aStream.
	aStream nextPut: $[;
			nextPutAll: probabilityDensityFunction class distributionName;
			nextPut: $].
]

{ #category : #transformation }
PMScaledProbabilityDensityFunction >> setCount: aNumber [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	count := aNumber.
]

{ #category : #information }
PMScaledProbabilityDensityFunction >> value: aNumber [ 
	"
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 3/3/99 "

	^(probabilityDensityFunction value: aNumber) * binWidth * count
]

{ #category : #information }
PMScaledProbabilityDensityFunction >> valueAndGradient: aNumber [ 
	"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/3/99 "

	| g temp |
	g := probabilityDensityFunction valueAndGradient: aNumber.
	temp := binWidth * count.
	^Array with: g first * temp
		   with: ( (g last collect: [:each | each * temp]) copyWith: g first * binWidth)
]
