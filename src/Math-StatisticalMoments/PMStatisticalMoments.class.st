Class {
	#name : #PMStatisticalMoments,
	#superclass : #Object,
	#instVars : [
		'moments'
	],
	#category : 'Math-StatisticalMoments'
}

{ #category : #creation }
PMStatisticalMoments class >> new [

	^ self new: 4
]

{ #category : #creation }
PMStatisticalMoments class >> new: anInteger [
	"anInteger is the degree of the highest central moments accumulated within the created instance."

	^ self basicNew initialize: anInteger + 1
]

{ #category : #transformation }
PMStatisticalMoments >> accumulate: aNumber [

	| correction n n1 oldSums pascal nTerm cTerm term |
	n := moments at: 1.
	n1 := n + 1.
	correction := ((moments at: 2) - aNumber) / n1.
	oldSums := moments copyFrom: 1 to: moments size.
	moments
		at: 1 put: n1;
		at: 2 put: (moments at: 2) - correction.
	pascal := Array new: moments size.
	pascal atAllPut: 0.
	pascal
		at: 1 put: 1;
		at: 2 put: 1.
	nTerm := -1.
	cTerm := correction.
	n1 := n / n1.
	n := n negated.
	3 to: moments size do: [ :k | 
		cTerm := cTerm * correction.
		nTerm := n * nTerm.
		term := cTerm * (1 + nTerm).
		k to: 3 by: -1 do: [ :l | 
			pascal at: l put: (pascal at: l - 1) + (pascal at: l).
			term := (pascal at: l) * (oldSums at: l) + term.
			oldSums at: l put: (oldSums at: l) * correction ].
		pascal at: 2 put: (pascal at: 1) + (pascal at: 2).
		moments at: k put: term * n1 ]
]

{ #category : #creation }
PMStatisticalMoments >> asWeightedPoint: aNumber [

	^ PMWeightedPoint point: aNumber @ self average error: self errorOnAverage
]

{ #category : #information }
PMStatisticalMoments >> average [

	self count = 0
		ifTrue: [ ^ nil ].
	^ moments at: 2
]

{ #category : #information }
PMStatisticalMoments >> centralMoment: anInteger [

	^ moments at: anInteger + 1
]

{ #category : #information }
PMStatisticalMoments >> count [

	^ moments at: 1
]

{ #category : #information }
PMStatisticalMoments >> errorOnAverage [

	^ (self variance / self count) sqrt
]

{ #category : #testing }
PMStatisticalMoments >> fConfidenceLevel: aStatisticalMomentsOrHistogram [
	| fValue |
	fValue := self variance/ aStatisticalMomentsOrHistogram variance.
	^fValue < 1
		ifTrue: [ (PMFisherSnedecorDistribution degreeOfFreedom: aStatisticalMomentsOrHistogram count
						degreeOfFreedom: self count) 
										confidenceLevel: fValue reciprocal]
		ifFalse:[ (PMFisherSnedecorDistribution degreeOfFreedom: self count
						degreeOfFreedom: aStatisticalMomentsOrHistogram count) 
										confidenceLevel: fValue]
]

{ #category : #initialization }
PMStatisticalMoments >> initialize: anInteger [ 
	"Private - ( anInteger - 1) is the degree of the highest accumulated central moment."

	moments := Array new: anInteger.
	self reset.
	^self
]

{ #category : #information }
PMStatisticalMoments >> kurtosis [

	| n n1 n23 |
	n := self count.
	n < 4 ifTrue: [^nil].
	n23 := (n - 2) * (n - 3).
	n1 := n - 1.
	^((moments at: 5) * n squared * (n + 1) / (self variance squared * n1) 
		- (n1 squared * 3)) / n23
]

{ #category : #transformation }
PMStatisticalMoments >> reset [

	moments atAllPut: 0
]

{ #category : #information }
PMStatisticalMoments >> skewness [

	| n v |
	n := self count.
	n < 3 ifTrue: [^nil].
	v := self variance.
	^(moments at: 4) * n squared / ((n - 1) * (n - 2) * (v sqrt * v))
]

{ #category : #information }
PMStatisticalMoments >> standardDeviation [
	^self variance sqrt
]

{ #category : #testing }
PMStatisticalMoments >> tConfidenceLevel: aStatisticalMomentsOrHistogram [
	| sbar dof |
	dof := self count + aStatisticalMomentsOrHistogram count - 2.
	sbar := ( ( self unnormalizedVariance + aStatisticalMomentsOrHistogram unnormalizedVariance) / dof) sqrt.
	^( PMStudentDistribution degreeOfFreedom: dof)
		confidenceLevel: ( self average - (aStatisticalMomentsOrHistogram average))
							/ ( ( 1 / self count + ( 1 / aStatisticalMomentsOrHistogram count)) sqrt * sbar)
]

{ #category : #information }
PMStatisticalMoments >> unnormalizedVariance [
	^( self centralMoment: 2) * self count
]

{ #category : #information }
PMStatisticalMoments >> variance [
	| n |
	n := self count.
	n < 2
		ifTrue: [ ^nil].
	^self unnormalizedVariance / ( n - 1)
]
