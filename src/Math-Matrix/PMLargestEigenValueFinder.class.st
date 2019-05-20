"
[ [ [ 
m := PMMatrix rows: #( ( 84 -79  58 55)
						(-79  84 -55 -58)
						( 58 -55  84  79) 
						( 55 -58  79  84) ).
finder := PMLargestEigenValueFinder matrix: m.
eigenvalue := finder evaluate.
eigenvector := finder eigenvector.
nextFinder := finder nextLargestEigenValueFinder.
nextEigenvalue := nextFinder evaluate.
nextEigenvector := nextFinder eigenvector.
] ] ]
"
Class {
	#name : #PMLargestEigenValueFinder,
	#superclass : #PMIterativeProcess,
	#instVars : [
		'matrix',
		'eigenvector',
		'transposeEigenvector'
	],
	#category : #'Math-Matrix'
}

{ #category : #information }
PMLargestEigenValueFinder class >> defaultMaximumIterations [
		"Private - Answers the default maximum number of iterations for newly created instances."
	^100
]

{ #category : #creation }
PMLargestEigenValueFinder class >> matrix: aMatrix [
	"Create a new instance of the receiver for a given matrix and default precision."

	^ self new
		initialize: aMatrix;
		yourself
]

{ #category : #creation }
PMLargestEigenValueFinder class >> matrix: aMatrix precision: aNumber [
	"Create a new instance of the receiver for a given matrix and desired precision."

	^ self new
		initialize: aMatrix;
		desiredPrecision: aNumber;
		yourself
]

{ #category : #information }
PMLargestEigenValueFinder >> eigenvalue [
	"Answer the eigen value found by the receiver."

	^result
]

{ #category : #information }
PMLargestEigenValueFinder >> eigenvector [
	"Answer the normalized eigen vector found by the receiver."

	^eigenvector * (1 / eigenvector norm)
]

{ #category : #operation }
PMLargestEigenValueFinder >> evaluateIteration [
	"Iterate the product of the matrix of the eigen vector and the transpose."

	| oldEigenvalue |
	oldEigenvalue := result.
	transposeEigenvector := transposeEigenvector * matrix.
	transposeEigenvector := transposeEigenvector 
				* (1 / (transposeEigenvector at: 1)).
	eigenvector := matrix * eigenvector.
	result := eigenvector at: 1.
	eigenvector := eigenvector * (1 / result).
	^oldEigenvalue isNil 
		ifTrue: [2 * desiredPrecision]
		ifFalse: [(result - oldEigenvalue) abs]
]

{ #category : #initialization }
PMLargestEigenValueFinder >> initialize: aMatrix [
		"Defines the matrix for the receiver."
	matrix := aMatrix.
]

{ #category : #operation }
PMLargestEigenValueFinder >> initializeIterations [
	"Initialize the iterations (subclasses must write their own method and call this one last)."

	eigenvector := PMVector new: matrix numberOfRows.
	eigenvector atAllPut: 1.0.
	transposeEigenvector := PMVector new: eigenvector size.
	transposeEigenvector atAllPut: 1.0
]

{ #category : #creation }
PMLargestEigenValueFinder >> nextLargestEigenValueFinder [
	"Return an eigen value finder for the same eigen values of the receiver except the one found."

	| norm |
	norm := 1 / (eigenvector * transposeEigenvector).
	^self class 
		matrix: matrix * ((PMSymmetricMatrix identity: eigenvector size) 
						- (eigenvector * norm tensorProduct: transposeEigenvector))
		precision: desiredPrecision
]
