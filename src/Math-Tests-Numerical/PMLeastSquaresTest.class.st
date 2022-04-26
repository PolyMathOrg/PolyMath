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
PMLeastSquaresTest >> testPseudoinverseOfDiagonalSquareMatrix [

	| matrix expectedInverse inverse |
	
	matrix := PMMatrix rows: #(
		(2 0 0 0)
		(0 1 0 0)
		(0 0 -3 0)
		(0 0 0 -1)).
		
	expectedInverse := PMMatrix rows: {
		{ 1/2 . 0 . 0 . 0 } .
		{ 0 . 1 . 0 . 0 } .
		{0 . 0 . -1/3 . 0} .
		{0 . 0 . 0 . -1 }}.
		
	inverse := leastSquares pseudoinverseOfDiagonal: matrix.
	self assert: inverse closeTo: expectedInverse.
]

{ #category : #tests }
PMLeastSquaresTest >> testPseudoinverseOfDiagonalSquareMatrixWithZeros [

	| matrix expectedInverse inverse |
	
	matrix := PMMatrix rows: #(
		(2 0 0 0)
		(0 1 0 0)
		(0 0 0 0)
		(0 0 0 0)).
		
	expectedInverse := PMMatrix rows: #(
		(0.5 0 0 0)
		(0 1 0 0)
		(0 0 0 0)
		(0 0 0 0)).
		
	inverse := leastSquares pseudoinverseOfDiagonal: matrix.
	self assert: inverse closeTo: expectedInverse.
]

{ #category : #tests }
PMLeastSquaresTest >> testPseudoinverseOfDiagonalTallMatrix [

	| matrix expectedInverse inverse |
	
	matrix := PMMatrix rows: #(
		(2 0 0 0)
		(0 1 0 0)
		(0 0 -3 0)
		(0 0 0 -1)
		(0 0 0 0)
		(0 0 0 0)).
		
	expectedInverse := PMMatrix rows: {
		{ 1/2 . 0 . 0 . 0 . 0 . 0 } .
		{ 0 . 1 . 0 . 0 . 0 . 0 } .
		{0 . 0 . -1/3 . 0 . 0 . 0 } .
		{0 . 0 . 0 . -1 . 0 . 0 }}.
		
	inverse := leastSquares pseudoinverseOfDiagonal: matrix.
	self assert: inverse closeTo: expectedInverse.
]

{ #category : #tests }
PMLeastSquaresTest >> testPseudoinverseOfDiagonalWideMatrix [

	| matrix expectedInverse inverse |
	
	matrix := PMMatrix rows: #(
		(2 0 0 0 0 0)
		(0 1 0 0 0 0)
		(0 0 -3 0 0 0)
		(0 0 0 -1 0 0)).
		
	expectedInverse := PMMatrix rows: {
		{ 1/2 . 0 . 0 . 0 } .
		{ 0 . 1 . 0 . 0 } .
		{0 . 0 . -1/3 . 0} .
		{0 . 0 . 0 . -1 } .
		{0 . 0 . 0 . 0 } .
		{0 . 0 . 0 . 0 }}.
		
	inverse := leastSquares pseudoinverseOfDiagonal: matrix.
	self assert: inverse closeTo: expectedInverse.
]

{ #category : #tests }
PMLeastSquaresTest >> testSolveIntelFortran [
	"An example of least squares system (AX = B) taken from Intel DGELSD Example Program in Fortran:
https://www.intel.com/content/www/us/en/develop/documentation/onemkl-lapack-examples/top/least-squares-and-eigenvalue-problems/linear-least-squares-lls-problems/gelsd-function/dgelsd-example/dgelsd-example-fortran.html"
	| matrixA matrixB expectedSolution solution |
	
	matrixA := PMMatrix rows: #(
		( 0.12  -8.19   7.69  -2.26  -4.71)
		(-6.91   2.22  -5.12  -9.08   9.96)
		(-3.33  -8.94  -6.72  -4.40  -9.98)
		( 3.97   3.33  -2.74  -7.92  -3.20)).
		
	matrixB := PMMatrix rows: #(
		(7.30   0.47  -6.28)
		(1.33   6.58  -3.42)
		(2.68  -1.71   3.46)
		(-9.62  -0.79   0.41)).
		
	expectedSolution := PMMatrix rows: #(
		(-0.69  -0.24   0.06)
		(-0.80  -0.08   0.21)
		( 0.38   0.12  -0.65)
		( 0.29  -0.24   0.42)
		( 0.29   0.35  -0.30)).
	
	solution := leastSquares
		solveMatrixA: matrixA
		matrixB: matrixB.
	
	self assert: solution closeTo: expectedSolution.
]

{ #category : #tests }
PMLeastSquaresTest >> testSolveSmallOneSolution [
	"Small example of least squares system (AX = B) with one solution taken from here: https://textbooks.math.gatech.edu/ila/least-squares.html"
	| matrixA vectorB expectedSolution solution |
	
	matrixA := PMMatrix rows: #(
		(0 1.1)
		(1 0)
		(0 -0.2)).
		
	vectorB := #(1.1 -1.1 -0.2) asPMVector.
	expectedSolution := #(-1.1 1) asPMVector.
	
	solution := leastSquares
		solveMatrixA: matrixA
		matrixB: vectorB.
	
	self assert: solution closeTo: expectedSolution.
]
