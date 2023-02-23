Class {
	#name : #PMChiSquareDistribution,
	#superclass : #PMGammaDistribution,
	#category : #'Math-Distributions-Gamma'
}

{ #category : #creation }
PMChiSquareDistribution class >> degreeOfFreedom: anInteger [
	"Create a new instance of the receiver with given degree of freedom."

	^ anInteger > 40
		ifTrue: [ PMAsymptoticChiSquareDistribution degreeOfFreedom: anInteger ]
		ifFalse: [ super shape: anInteger / 2 scale: 2 ]
]

{ #category : #information }
PMChiSquareDistribution class >> distributionName [

	^'Chi square distribution'
]

{ #category : #creation }
PMChiSquareDistribution class >> fromHistogram: aHistogram [
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit.	"
	| dof |
	aHistogram minimum < 0
		ifTrue: [ ^nil].
	dof := aHistogram average rounded.
	^dof > 0 ifTrue: [ self degreeOfFreedom: aHistogram average rounded]
			 ifFalse:[ nil]
]

{ #category : #creation }
PMChiSquareDistribution class >> shape: aNumber1 scale: aNumber2 [
	
	^self error: 'Illegal creation message for this class'
]

{ #category : #transformation }
PMChiSquareDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."

	super changeParametersBy: (Array with: aVector first / 2 with: 0)
]

{ #category : #information }
PMChiSquareDistribution >> confidenceLevel: aNumber [
	"Answer the probability in percent of finding a chi square value distributed according to the receiver larger than aNumber."

	^ (1 - (self distributionValue: aNumber)) * 100
]

{ #category : #information }
PMChiSquareDistribution >> parameters [

	^ Array with: alpha * 2
]
