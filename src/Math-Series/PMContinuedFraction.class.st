Class {
	#name : #PMContinuedFraction,
	#superclass : #PMInfiniteSeries,
	#instVars : [
		'numerator',
		'denominator'
	],
	#category : 'Math-Series'
}

{ #category : #operation }
PMContinuedFraction >> evaluateIteration [
		"Perform one iteration."
	| terms delta |
	terms := termServer termsAt: iterations.
	denominator := 1 / ( self limitedSmallValue: ( (terms at: 1) * denominator + (terms at: 2))).
	numerator := self limitedSmallValue: ( (terms at: 1) / numerator + (terms at: 2)).
	delta := numerator * denominator.
	result := result * delta.
	^( delta - 1) abs
]

{ #category : #operation }
PMContinuedFraction >> initializeIterations [
	"Initialize the series."

	numerator := self limitedSmallValue: termServer initialTerm.
	denominator := 0.
	result := numerator
]
