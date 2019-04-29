"
It has one additional instance variable compared to its superclass:

- covariance accumulates the components of the covariance matrix; for efficiency reason, only the lower half of the matrix is computed since it is symmetric.
"
Class {
	#name : #PMCovarianceAccumulator,
	#superclass : #PMVectorAccumulator,
	#instVars : [
		'covariance'
	],
	#category : #'Math-Numerical-Math-UtilsAccumulator'
}

{ #category : #transformation }
PMCovarianceAccumulator >> accumulate: anArray [
	"Accumulate anArray into the receiver."
	| delta count1 r|
	count1 := count.
	delta := super accumulate: anArray.
	r := count1 / count.
	1 to: delta size
		do: [ :n |
			  1 to: n do:
				  [ :m |
					( covariance at: n) at: m put: ( count1 * ( delta at: n) * ( delta at: m) + ( r * ( ( covariance at: n) at: m))).
				  ].
			].
]

{ #category : #information }
PMCovarianceAccumulator >> covarianceMatrix [
	"Answer a matrix containing the covariance of the accumulated data."
	| rows n |
	n := 0.
	rows := covariance collect:
				[ :row | n := n + 1. row, ( ( ( n + 1) to: covariance size) collect: [ :m | ( covariance at: m) at: n ])].
	^PMSymmetricMatrix rows: rows
]

{ #category : #initialization }
PMCovarianceAccumulator >> initialize: anInteger [

	covariance := ( ( 1 to: anInteger) collect: [ :n | PMVector new: n]) asPMVector.
	^super initialize: anInteger
]

{ #category : #initialization }
PMCovarianceAccumulator >> reset [
	"Set all accumulators to zero."

	super reset.
	covariance do: [ :each | each atAllPut: 0 ]
]
