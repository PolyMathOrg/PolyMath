Class {
	#name : #PMPolynomialLeastSquareFit,
	#superclass : #Object,
	#instVars : [
		'pointCollection',
		'degreePlusOne'
	],
	#category : 'Math-Polynomials'
}

{ #category : #creation }
PMPolynomialLeastSquareFit class >> new: anInteger [
		"Create a new instance of the receiver with given degree."
	^super new initialize: anInteger
]

{ #category : #creation }
PMPolynomialLeastSquareFit class >> new: anInteger on: aCollectionOfPoints [
		"Create a new instance of the receiver with given degree and points."
	^super new initialize: anInteger on: aCollectionOfPoints
]

{ #category : #transformation }
PMPolynomialLeastSquareFit >> accumulate: aWeightedPoint into: aVectorOfVectors and: aVector [
		"Private"
	| t p powers |
	p := 1.0.
	powers := aVector collect: [ :each | t := p. p := p * aWeightedPoint xValue. t].
	aVector accumulate: powers * ( aWeightedPoint yValue * aWeightedPoint weight).
	1 to: aVector size do:
		[ :k |
		  ( aVectorOfVectors at: k) accumulate: powers * ( ( powers at: k) * aWeightedPoint weight).
		]
]

{ #category : #transformation }
PMPolynomialLeastSquareFit >> add: aWeightedPoint [
		"Add a point to the collection of points."
	^pointCollection add: aWeightedPoint
]

{ #category : #transformation }
PMPolynomialLeastSquareFit >> computeEquations [
		"Private - Answer a pair Matrix/Vector defining the system of equations
		 to solve the receiver."
	| rows vector |
	vector := ( PMVector new: degreePlusOne) atAllPut: 0 ; yourself.
	rows := ( 1 to: degreePlusOne) collect: [ :k | ( PMVector new: degreePlusOne) atAllPut: 0 ; yourself].
	pointCollection do:
		[ :each | self accumulate: each into: rows and: vector].
	^Array with: ( PMSymmetricMatrix rows: rows) with: vector
]

{ #category : #information }
PMPolynomialLeastSquareFit >> evaluate [
		"Perform the least square fit and answers the fitted polynomial."
	| system errorMatrix |
	system := self computeEquations.
	errorMatrix := ( system at: 1) inverse.
	^( PMEstimatedPolynomial coefficients: errorMatrix * (system at: 2))
			errorMatrix: errorMatrix;
			yourself
]

{ #category : #initialization }
PMPolynomialLeastSquareFit >> initialize: anInteger [
		"Private - Create an empty point collection for the receiver."
	^self initialize: anInteger on: OrderedCollection new
]

{ #category : #initialization }
PMPolynomialLeastSquareFit >> initialize: anInteger on: aCollectionOfPoints [
		"Private - Defines the collection of points for the receiver."
	pointCollection := aCollectionOfPoints.
	degreePlusOne := anInteger + 1.
	^self
]
