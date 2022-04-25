"
A PMLeastSquaresTest is a test class for testing the behavior of PMLeastSquares
"
Class {
	#name : #PMLeastSquaresTest,
	#superclass : #TestCase,
	#instVars : [
		'matrixA',
		'vectorB',
		'expectedSolution'
	],
	#category : #'Math-Tests-Numerical'
}

{ #category : #running }
PMLeastSquaresTest >> setUp [
	super setUp.
	
	"Put here a common initialization logic for tests"
	
	matrixA := PMMatrix rows: #(
		(0 1.1)
		(1 0)
		(0 -0.2)).
		
	vectorB := #(1.1 -1.1 -0.2) asPMVector.
	expectedSolution := #(-1.1 1) asPMVector.
]

{ #category : #tests }
PMLeastSquaresTest >> testSolve [

	| leastSquares solution |
	leastSquares := PMLeastSquares new.
	
	solution := leastSquares solveMatrixA: matrixA vectorB: vectorB.
	
	self assert: solution closeTo: expectedSolution.
]
