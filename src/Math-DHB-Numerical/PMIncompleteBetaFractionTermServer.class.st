Class {
	#name : #PMIncompleteBetaFractionTermServer,
	#superclass : #PMSeriesTermServer,
	#instVars : [
		'alpha1',
		'alpha2'
	],
	#category : 'Math-DHB-Numerical'
}

{ #category : #information }
PMIncompleteBetaFractionTermServer >> initialTerm [
	^1
]

{ #category : #initialization }
PMIncompleteBetaFractionTermServer >> setParameter: aNumber1 second: aNumber2 [ 
	alpha1 := aNumber1.
	alpha2 := aNumber2
]

{ #category : #information }
PMIncompleteBetaFractionTermServer >> termsAt: anInteger [ 

	| n n2 |
	n := anInteger // 2.
	n2 := 2 * n.
	^Array with: ( n2 < anInteger 
		ifTrue: 
			[x negated * (alpha1 + n) * (alpha1 + alpha2 + n) 
				/ ((alpha1 + n2) * (alpha1 + 1 + n2))]
		ifFalse: [x * n * (alpha2 - n) / ((alpha1 + n2) * (alpha1 - 1 + n2))])
			with: 1
]
