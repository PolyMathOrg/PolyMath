Class {
	#name : #PMLeastSquaresFixture,
	#superclass : #Object,
	#instVars : [
		'matrixA',
		'matrixB',
		'matrixX'
	],
	#category : #'Math-Tests-Numerical'
}

{ #category : #initialization }
PMLeastSquaresFixture >> initialize [ 
	super initialize.
	self initializeMatrixA.
	self initializeMatrixB.
	self initializeMatrixX.
]

{ #category : #initialization }
PMLeastSquaresFixture >> initializeMatrixA [

	self subclassResponsibility
]

{ #category : #initialization }
PMLeastSquaresFixture >> initializeMatrixB [

	self subclassResponsibility
]

{ #category : #initialization }
PMLeastSquaresFixture >> initializeMatrixX [

	self subclassResponsibility
]

{ #category : #accessing }
PMLeastSquaresFixture >> matrixA [

	^ matrixA
]

{ #category : #accessing }
PMLeastSquaresFixture >> matrixB [

	^ matrixB
]

{ #category : #accessing }
PMLeastSquaresFixture >> matrixX [

	^ matrixX
]
