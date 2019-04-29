Class {
	#name : #PMBulirschStoerInterpolator,
	#superclass : #PMNevilleInterpolator,
	#category : #'Math-DHB-Numerical-Math-Interpolator'
}

{ #category : #private }
PMBulirschStoerInterpolator >> computeDifference: aNumber at: anInteger1 order: anInteger2 [

	| diff ratio |
	ratio := ( ( self xPointAt: anInteger1) - aNumber) * ( rightErrors at: anInteger1)
							/ ( (  self xPointAt: ( anInteger1 + anInteger2)) - aNumber).
	diff := ( ( leftErrors at: ( anInteger1 + 1)) - ( rightErrors at: anInteger1))
							/ ( ratio - ( leftErrors at: ( anInteger1 + 1))).
	rightErrors at: anInteger1 put: ( leftErrors at: ( anInteger1 + 1)) * diff.	
	leftErrors at: anInteger1 put: ratio * diff.
]
