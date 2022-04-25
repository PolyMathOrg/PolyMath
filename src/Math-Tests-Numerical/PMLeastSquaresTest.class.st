"
A PMLeastSquaresTest is a test class for testing the behavior of PMLeastSquares
"
Class {
	#name : #PMLeastSquaresTest,
	#superclass : #TestCase,
	#instVars : [
		'leastSquares'
	],
	#category : #'Math-Tests-Numerical'
}

{ #category : #running }
PMLeastSquaresTest >> setUp [
	super setUp.
	leastSquares := PMLeastSquares new.
]

{ #category : #tests }
PMLeastSquaresTest >> testSolveIntelFortran [

	| fixture solution |
	
	fixture := PMLeastSquaresFixtureIntelFortran new.
	
	solution := leastSquares
		solveMatrixA: fixture matrixA
		matrixB: fixture matrixB.
	
	self assert: solution closeTo: fixture matrixX.
]

{ #category : #tests }
PMLeastSquaresTest >> testSolveSmallOneSolution [

	| fixture solution |
	
	fixture := PMLeastSquaresFixtureSmallOneSolution new.
	
	solution := leastSquares
		solveMatrixA: fixture matrixA
		matrixB: fixture matrixB.
	
	self assert: solution closeTo: fixture matrixX.
]
