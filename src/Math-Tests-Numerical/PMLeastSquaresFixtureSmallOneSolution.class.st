"
Small example of least squares system (AX = B) with one solution taken from here: https://textbooks.math.gatech.edu/ila/least-squares.html
"
Class {
	#name : #PMLeastSquaresFixtureSmallOneSolution,
	#superclass : #PMLeastSquaresFixture,
	#category : #'Math-Tests-Numerical'
}

{ #category : #initialization }
PMLeastSquaresFixtureSmallOneSolution >> initializeMatrixA [

	matrixA := PMMatrix rows: #(
		(0 1.1)
		(1 0)
		(0 -0.2)).
]

{ #category : #initialization }
PMLeastSquaresFixtureSmallOneSolution >> initializeMatrixB [

	matrixB := #(1.1 -1.1 -0.2) asPMVector.
]

{ #category : #initialization }
PMLeastSquaresFixtureSmallOneSolution >> initializeMatrixX [

	matrixX := #(-1.1 1) asPMVector.
]
