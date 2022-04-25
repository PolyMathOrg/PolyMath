"
An example of least squares system (AX = B) taken from Intel DGELSD Example Program in Fortran:
https://www.intel.com/content/www/us/en/develop/documentation/onemkl-lapack-examples/top/least-squares-and-eigenvalue-problems/linear-least-squares-lls-problems/gelsd-function/dgelsd-example/dgelsd-example-fortran.html

"
Class {
	#name : #PMLeastSquaresFixtureIntelFortran,
	#superclass : #PMLeastSquaresFixture,
	#category : #'Math-Tests-Numerical'
}

{ #category : #initialization }
PMLeastSquaresFixtureIntelFortran >> initializeMatrixA [

	matrixA := PMMatrix rows: #(
		( 0.12  -8.19   7.69  -2.26  -4.71)
		(-6.91   2.22  -5.12  -9.08   9.96)
		(-3.33  -8.94  -6.72  -4.40  -9.98)
		( 3.97   3.33  -2.74  -7.92  -3.20)).
]

{ #category : #initialization }
PMLeastSquaresFixtureIntelFortran >> initializeMatrixB [

	matrixB := PMMatrix rows: #(
		(7.30   0.47  -6.28)
		(1.33   6.58  -3.42)
		(2.68  -1.71   3.46)
		(-9.62  -0.79   0.41)).
]

{ #category : #initialization }
PMLeastSquaresFixtureIntelFortran >> initializeMatrixX [

	matrixX := PMMatrix rows: #(
		(-0.69  -0.24   0.06)
		(-0.80  -0.08   0.21)
		( 0.38   0.12  -0.65)
		( 0.29  -0.24   0.42)
		( 0.29   0.35  -0.30)).
]
