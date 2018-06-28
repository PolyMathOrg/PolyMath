Class {
	#name : #PMEstimatedPolynomial,
	#superclass : #PMPolynomial,
	#instVars : [
		'errorMatrix'
	],
	#category : 'Math-Polynomials'
}

{ #category : #information }
PMEstimatedPolynomial >> error: aNumber [
		"Compute the error on the value of the receiver for argument aNumber."
	| errorVector term nextTerm |
	nextTerm := 1.
	errorVector := ( coefficients collect: [ :each | term := nextTerm. nextTerm := aNumber * nextTerm. term]) asPMVector.
	^( errorVector * errorMatrix * errorVector) sqrt
]

{ #category : #information }
PMEstimatedPolynomial >> errorMatrix [
	^errorMatrix
]

{ #category : #initialization }
PMEstimatedPolynomial >> errorMatrix: aMatrix [
		"Defines the error matrix of the receiver."
	errorMatrix := aMatrix.
]

{ #category : #information }
PMEstimatedPolynomial >> valueAndError: aNumber [
	^ Array with: (self value: aNumber) with: (self error: aNumber)
]
