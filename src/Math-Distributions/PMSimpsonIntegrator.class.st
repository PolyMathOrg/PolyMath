Class {
	#name : #PMSimpsonIntegrator,
	#superclass : #PMTrapezeIntegrator,
	#category : #'Math-Distributions-Core'
}

{ #category : #operation }
PMSimpsonIntegrator >> evaluateIteration [
	| oldResult oldSum |
	iterations < 2
		ifTrue: [ self higherOrderSum.
				  ^1
				].
	oldResult := result.
	oldSum := sum.
	result := (self higherOrderSum * 4 - oldSum) / 3.
	^self relativePrecision: ( result - oldResult) abs
]
