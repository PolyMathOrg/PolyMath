Class {
	#name : #PMIncompleteBetaFunctionFraction,
	#superclass : #PMIterativeProcess,
	#instVars : [
		'x',
		'q1',
		'q2',
		'q3',
		'numerator',
		'denominator',
		'alpha1',
		'alpha2'
	],
	#category : #'Math-DHB-Numerical'
}

{ #category : #creation }
PMIncompleteBetaFunctionFraction class >> shape: aNumber1 shape: aNumber2 [
	"Create an instance of the receiver with given shape parameters."

	^ super new initialize: aNumber1 shape: aNumber2
]

{ #category : #operation }
PMIncompleteBetaFunctionFraction >> evaluateIteration [
	"Compute and add the next term of the fraction."

	| m m2 temp |
	m := iterations + 1.
	m2 := m * 2.
	temp := m * (alpha2 - m) * x 
				/ ((q3 + m2) * (alpha1 + m2)).
	denominator := self limitedSmallValue: ( denominator * temp + 1).
	numerator := self limitedSmallValue: ( temp / numerator + 1).
	denominator := 1 / denominator.
	result := result * numerator * denominator.
	temp := (alpha1 + m) negated * (q1 + m) * x 
				/ ((q2 + m2) * (alpha1 + m2)).
	denominator := self limitedSmallValue: ( denominator * temp + 1).
	numerator := self limitedSmallValue: ( temp / numerator + 1).
	denominator := 1 / denominator.
	temp := numerator * denominator.
	result := result * temp.
	^(temp - 1) abs
]

{ #category : #initialization }
PMIncompleteBetaFunctionFraction >> initialize: aNumber1 shape: aNumber2 [ 
	"Private - Initialize the parameters of the receiver."

	alpha1 := aNumber1.
	alpha2 := aNumber2.
	q1 := alpha1 + alpha2.
	q2 := alpha1 + 1.
	q3 := alpha1 - 1
]

{ #category : #operation }
PMIncompleteBetaFunctionFraction >> initializeIterations [
	"Initialize the iterations (subclasses must write their own method and call this one last)."

	numerator := 1.
	denominator := 1 / (self limitedSmallValue: 1 - (q1 * x / q2)).
	result := denominator
]

{ #category : #initialization }
PMIncompleteBetaFunctionFraction >> setArgument: aNumber [
	x := aNumber
]
