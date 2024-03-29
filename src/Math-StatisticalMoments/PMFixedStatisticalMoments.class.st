Class {
	#name : #PMFixedStatisticalMoments,
	#superclass : #PMStatisticalMoments,
	#category : #'Math-StatisticalMoments'
}

{ #category : #creation }
PMFixedStatisticalMoments class >> new [
	^super new: 4
]

{ #category : #creation }
PMFixedStatisticalMoments class >> new: anInteger [
	^self error: 'Illegal creation message for this class'
]

{ #category : #transformation }
PMFixedStatisticalMoments >> accumulate: aNumber [
	| correction n n1 c2 c3 |
	n := moments at: 1.
	n1 := n + 1.
	correction := ((moments at: 2) - aNumber) / n1.
	c2 := correction squared.
	c3 := c2 * correction.
	moments
		at: 5
			put: ((moments at: 5) + ((moments at: 4) * correction * 4)
					+ ((moments at: 3) * c2 * 6) + (c2 squared * (n squared * n + 1)))
					* n / n1;
		at: 4
			put: ((moments at: 4) + ((moments at: 3) * correction * 3)
					+ (c3 * (1 - n squared))) * n
					/ n1;
		at: 3 put: ((moments at: 3) + (c2 * (1 + n))) * n / n1;
		at: 2 put: (moments at: 2) - correction;
		at: 1 put: n1
]
