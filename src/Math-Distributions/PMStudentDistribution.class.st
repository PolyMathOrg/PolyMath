Class {
	#name : #PMStudentDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'degreeOfFreedom',
		'norm',
		'chiSquareDistribution',
		'incompleteBetaFunction'
	],
	#category : #'Math-Distributions-ForHistogram'
}

{ #category : #creation }
PMStudentDistribution class >> asymptoticLimit [
	
	^30
]

{ #category : #creation }
PMStudentDistribution class >> degreeOfFreedom: anInteger [ 
	"Create a new instance of the receiver with anInteger degrees of freedom."

	^anInteger > self asymptoticLimit 
		ifTrue: [PMNormalDistribution new]
		ifFalse: 
			[anInteger = 1 
				ifTrue: [PMCauchyDistribution shape: 0 scale: 1]
				ifFalse: [super new initialize: anInteger]]
]

{ #category : #information }
PMStudentDistribution class >> distributionName [

	^'Student distribution'
]

{ #category : #creation }
PMStudentDistribution class >> fromHistogram: aHistogram [
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit."
	| dof var |
	var := aHistogram variance.
	var = 0
		ifTrue: [ ^nil].
	dof :=  ( 2 / (1 - (1 / aHistogram variance))) rounded max: 1.
	^dof > self asymptoticLimit ifTrue: [ nil]
								ifFalse:[ self degreeOfFreedom: dof]
]

{ #category : #creation }
PMStudentDistribution class >> new [

	^self error: 'Illegal creation message for this class'
]

{ #category : #creation }
PMStudentDistribution class >> test: aStatisticalMoment1 with: aStatisticalMoment2 [
	"Perform a consistency Student test (or t-test) on the averages of  two statistical moments ( or histograms). Answers the probability of failing the test."
	| t |
	t := ( aStatisticalMoment1 average - aStatisticalMoment2 average) abs.
	^1 - ( ( self class degreeOfFreedom: (  aStatisticalMoment1 count + aStatisticalMoment2 count - 2)) acceptanceBetween: t negated and: t)
]

{ #category : #information }
PMStudentDistribution >> average [

	^0
]

{ #category : #transformation }
PMStudentDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."
	degreeOfFreedom := degreeOfFreedom + ( aVector at: 1).
	self computeNorm.
]

{ #category : #information }
PMStudentDistribution >> chiSquareDistribution [
	"Answer the chi square distribution used to generate random numbers for the receiver."
	chiSquareDistribution isNil
		ifTrue: [ chiSquareDistribution := PMChiSquareDistribution degreeOfFreedom: (degreeOfFreedom - 1)].
	^chiSquareDistribution
]

{ #category : #private }
PMStudentDistribution >> computeNorm [
	"Private - Compute the norm of the receiver because its parameters have changed."
	norm := ( ( degreeOfFreedom / 2 logBeta: ( 1 / 2) ) + ( degreeOfFreedom ln / 2)) negated.
]

{ #category : #information }
PMStudentDistribution >> confidenceLevel: aNumber [
	"Answer the probability in percent of finding a value distributed according to the receiver with an absolute value larger than aNumber."
	^( 1 - ( self symmetricAcceptance: aNumber abs)) * 100
]

{ #category : #information }
PMStudentDistribution >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."
	aNumber = 0
		ifTrue: [ ^1/2].
	^( aNumber > 0
		ifTrue: [ 2 - ( self symmetricAcceptance: aNumber abs)]
		ifFalse:[ self symmetricAcceptance: aNumber abs]) / 2
]

{ #category : #information }
PMStudentDistribution >> incompleteBetaFunction [
	"Private - Answers the incomplete beta function used to compute the symmetric acceptance integral of the receiver."

	incompleteBetaFunction isNil 
		ifTrue: 
			[incompleteBetaFunction := PMIncompleteBetaFunction 
						shape: degreeOfFreedom / 2
						shape: 0.5].
	^incompleteBetaFunction
]

{ #category : #initialization }
PMStudentDistribution >> initialize: anInteger [

	anInteger > 0
		ifFalse: [ self error: 'Degree of freedom must be positive'].
	degreeOfFreedom := anInteger.
	self computeNorm.
	^self
]

{ #category : #information }
PMStudentDistribution >> kurtosis [
	"Answer the kurtosis of the receiver. Undefined if the degree of freedom is less than 5."
	^degreeOfFreedom > 4 ifTrue: [ 6 / ( degreeOfFreedom - 4)]
						 ifFalse:[ nil]
]

{ #category : #information }
PMStudentDistribution >> parameters [

	^Array with: degreeOfFreedom
]

{ #category : #information }
PMStudentDistribution >> random [
	"Answer a random number distributed according to the receiver."
	^PMNormalDistribution random * ( ( (degreeOfFreedom - 1) / self chiSquareDistribution random ) sqrt)
]

{ #category : #information }
PMStudentDistribution >> skewness [
		
	^0
]

{ #category : #information }
PMStudentDistribution >> symmetricAcceptance: aNumber [
	"Compute the acceptance of the receiver between -aNumber and aNumber"
	^ self incompleteBetaFunction value: ( degreeOfFreedom / ( aNumber squared + degreeOfFreedom))
]

{ #category : #information }
PMStudentDistribution >> value: aNumber [
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^( norm - ( ( aNumber squared / degreeOfFreedom + 1) ln * ( ( degreeOfFreedom + 1) / 2))) exp
]

{ #category : #information }
PMStudentDistribution >> variance [
	"Answer the variance of the receiver. Undefined if the degree of freedom is less than 3."
	^degreeOfFreedom > 2 
		ifTrue: [ degreeOfFreedom / ( degreeOfFreedom - 2)]
		ifFalse:[ nil]
]
