"
A PMLeastSquaresTest is a test class for testing the behavior of PMLeastSquares
"
Class {
	#name : 'PMLeastSquaresTest',
	#superclass : 'TestCase',
	#instVars : [
		'leastSquares'
	],
	#category : 'Math-Tests-Numerical',
	#package : 'Math-Tests-Numerical'
}

{ #category : 'running' }
PMLeastSquaresTest >> setUp [

	super setUp.
	leastSquares := PMLeastSquares new
]

{ #category : 'tests' }
PMLeastSquaresTest >> testPseudoinverseOfDiagonalSquareMatrix [

	| matrix expectedInverse inverse |

	matrix := PMMatrix rows: #(
		(2  0  0  0)
		(0  1  0  0)
		(0  0 -3  0)
		(0  0  0 -1) ).

	expectedInverse := PMMatrix rows: {
		{ 1/2 . 0 .   0  .  0 } .
		{  0  . 1 .   0  .  0 } .
		{  0  . 0 . -1/3 .  0} .
		{  0  . 0 .   0  . -1 } }.

	inverse := leastSquares pseudoinverseOfDiagonal: matrix.
	self assert: inverse closeTo: expectedInverse
]

{ #category : 'tests' }
PMLeastSquaresTest >> testPseudoinverseOfDiagonalSquareMatrixWithZeros [

	| matrix expectedInverse inverse |

	matrix := PMMatrix rows: #(
		(2 0 0 0)
		(0 1 0 0)
		(0 0 0 0)
		(0 0 0 0) ).

	expectedInverse := PMMatrix rows: #(
		(0.5 0  0  0)
		( 0  1  0  0)
		( 0  0  0  0)
		( 0  0  0  0) ).

	inverse := leastSquares pseudoinverseOfDiagonal: matrix.
	self assert: inverse closeTo: expectedInverse
]

{ #category : 'tests' }
PMLeastSquaresTest >> testPseudoinverseOfDiagonalTallMatrix [

	| matrix expectedInverse inverse |

	matrix := PMMatrix rows: #(
		(2  0  0  0)
		(0  1  0  0)
		(0  0 -3  0)
		(0  0  0 -1)
		(0  0  0  0)
		(0  0  0  0) ).

	expectedInverse := PMMatrix rows: {
		{ 1/2 . 0 .    0 .  0 . 0 . 0 } .
		{   0 . 1 .    0 .  0 . 0 . 0 } .
		{   0 . 0 . -1/3 .  0 . 0 . 0 } .
		{   0 . 0 .    0 . -1 . 0 . 0 }}.

	inverse := leastSquares pseudoinverseOfDiagonal: matrix.
	self assert: inverse closeTo: expectedInverse
]

{ #category : 'tests' }
PMLeastSquaresTest >> testPseudoinverseOfDiagonalWideMatrix [

	| matrix expectedInverse inverse |

	matrix := PMMatrix rows: #(
		(2 0  0  0  0  0)
		(0 1  0  0  0  0)
		(0 0 -3  0  0  0)
		(0 0  0 -1  0  0)).

	expectedInverse := PMMatrix rows: {
		{ 1/2 . 0 . 0 . 0 } .
		{ 0 . 1 . 0 . 0 } .
		{0 . 0 . -1/3 . 0} .
		{0 . 0 . 0 . -1 } .
		{0 . 0 . 0 . 0 } .
		{0 . 0 . 0 . 0 }}.

	inverse := leastSquares pseudoinverseOfDiagonal: matrix.
	self assert: inverse closeTo: expectedInverse
]

{ #category : 'tests' }
PMLeastSquaresTest >> testSolveSmallOneSolution [
	"Small example of least squares system (AX = B) with one solution taken from here: https://textbooks.math.gatech.edu/ila/least-squares.html"
	| matrixA vectorB expectedSolution solution |

	matrixA := PMMatrix rows: #(
		(0   1.1)
		(1    0 )
		(0  -0.2) ).

	vectorB := #(1.1 -1.1 -0.2) asPMVector.
	expectedSolution := #(-1.1 1) asPMVector.

	solution := leastSquares
		solveMatrixA: matrixA
		matrixB: vectorB.

	self assert: solution closeTo: expectedSolution
]
