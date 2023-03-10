Class {
	#name : #PMCovarianceAccumulatorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Numerical'
}

{ #category : #tests }
PMCovarianceAccumulatorTest >> testCovarianceAccumulation [

	"Code example 12.2"

	| accumulator average covarianceMatrix |
	accumulator := PMCovarianceAccumulator new: 3.
	#( #( 1 2 3 ) #( 2 3 4 ) #( 1 3 2 ) #( 4 3 1 ) #( 1 3 1 ) #( 1 4 2 )
	   #( 3 1 2 ) #( 3 4 2 ) ) do: [ :x |
		accumulator accumulate: x asPMVector ].
	average := accumulator average.
	self assert: ((average at: 1) closeTo: 2.0).
	self assert: ((average at: 2) closeTo: 2.875).
	self assert: ((average at: 3) closeTo: 2.125).
	covarianceMatrix := accumulator covarianceMatrix.
	self assert: (((covarianceMatrix rowAt: 1) at: 1) closeTo: 1.25).
	self assert: (((covarianceMatrix rowAt: 1) at: 2) closeTo: -0.125).
	self assert: (((covarianceMatrix rowAt: 2) at: 1) closeTo: -0.125).
	self assert: (((covarianceMatrix rowAt: 1) at: 3) closeTo: -0.25).
	self assert: (((covarianceMatrix rowAt: 3) at: 1) closeTo: -0.25).
	self assert: (((covarianceMatrix rowAt: 2) at: 2) closeTo: 0.859375).
	self assert: (((covarianceMatrix rowAt: 2) at: 3) closeTo: -0.109375).
	self assert: (((covarianceMatrix rowAt: 3) at: 2) closeTo: -0.109375).
	self assert: (((covarianceMatrix rowAt: 3) at: 3) closeTo: 0.859375)
]
