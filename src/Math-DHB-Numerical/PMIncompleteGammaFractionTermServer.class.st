Class {
	#name : #PMIncompleteGammaFractionTermServer,
	#superclass : #PMSeriesTermServer,
	#instVars : [
		'alpha'
	],
	#category : #'Math-DHB-Numerical'
}

{ #category : #information }
PMIncompleteGammaFractionTermServer >> initialTerm [
	lastTerm := x - alpha + 1.
	^lastTerm
]

{ #category : #initialization }
PMIncompleteGammaFractionTermServer >> setParameter: aNumber [ 
	alpha := aNumber asFloat
]

{ #category : #information }
PMIncompleteGammaFractionTermServer >> termsAt: anInteger [ 
	lastTerm := lastTerm + 2.
	^Array with: (alpha - anInteger) * anInteger with: lastTerm
]
