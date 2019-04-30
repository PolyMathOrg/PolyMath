Class {
	#name : #PMProbabilityDistributionFunction,
	#superclass : #Object,
	#instVars : [
		'probabilityDensity'
	],
	#category : #'Math-Numerical'
}

{ #category : #creation }
PMProbabilityDistributionFunction class >> density: aProbabilityDensity [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	^self new initialize: aProbabilityDensity
]

{ #category : #initialization }
PMProbabilityDistributionFunction >> initialize: aProbabilityDensity [
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	probabilityDensity := aProbabilityDensity.
	^self
]

{ #category : #information }
PMProbabilityDistributionFunction >> value: aNumber [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	^probabilityDensity distributionValue: aNumber
]
