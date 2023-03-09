Class {
	#name : #PMIncompleteGammaSeriesTermServer,
	#superclass : #PMSeriesTermServer,
	#instVars : [
		'alpha',
		'sum'
	],
	#category : #'Math-Distributions-Gamma'
}

{ #category : #information }
PMIncompleteGammaSeriesTermServer >> initialTerm [
	lastTerm := 1 / alpha.
	sum := alpha.
	^lastTerm
]

{ #category : #initialization }
PMIncompleteGammaSeriesTermServer >> setParameter: aNumber [
	alpha := aNumber asFloat
]

{ #category : #information }
PMIncompleteGammaSeriesTermServer >> termAt: anInteger [
	sum := sum + 1.
	lastTerm := lastTerm * x / sum.
	^lastTerm
]
