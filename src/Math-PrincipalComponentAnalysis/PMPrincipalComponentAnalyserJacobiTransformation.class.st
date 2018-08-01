"
I'm implementing a principle component analysis with Jacobi transformation of the covariante matrix.
Clients should first 
- create myself specifying a size which represents the number of elements on which I should be working. 
- accumulate: (give a certain amount of vectors of the elements to compare)
- then ask for the components


"
Class {
	#name : #PMPrincipalComponentAnalyserJacobiTransformation,
	#superclass : #PMPrincipalComponentAnalyser,
	#instVars : [
		'accumulatorForCovarianceMatrix',
		'jacobiTransform'
	],
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #'instance creation' }
PMPrincipalComponentAnalyserJacobiTransformation class >> new: anInteger [
	"anInteger is the size of the elements you will accumulate: the elements you want to compare using the component analysis."
	^ self basicNew initialize: anInteger; yourself.
]

{ #category : #transformation }
PMPrincipalComponentAnalyserJacobiTransformation >> accumulate: aPMVectorOrArray [
	accumulatorForCovarianceMatrix accumulate: aPMVectorOrArray
]

{ #category : #accessing }
PMPrincipalComponentAnalyserJacobiTransformation >> components [
	"Precondition: accumulate: should have been used."

	^ self jacobiTransform evaluate copyFrom: 1 to: componentsNumber
]

{ #category : #accessing }
PMPrincipalComponentAnalyserJacobiTransformation >> fit: aPMMatrix [
	self initialize: aPMMatrix numberOfColumns.
	aPMMatrix rowsDo: [ :eachRow | self accumulate: eachRow ].
	self components
]

{ #category : #initialization }
PMPrincipalComponentAnalyserJacobiTransformation >> initialize: anInteger [
	accumulatorForCovarianceMatrix := PMCovarianceAccumulator new: anInteger
]

{ #category : #accessing }
PMPrincipalComponentAnalyserJacobiTransformation >> jacobiTransform [
	^ jacobiTransform ifNil: [ jacobiTransform := PMJacobiTransformation matrix: accumulatorForCovarianceMatrix covarianceMatrix ]
]

{ #category : #accessing }
PMPrincipalComponentAnalyserJacobiTransformation >> transform: aPMMatrix [
	"Apply dimensionality reduction to aPMMatrix"

	^ aPMMatrix * self transformMatrix transpose
]

{ #category : #accessing }
PMPrincipalComponentAnalyserJacobiTransformation >> transformMatrix [
	"Return a matrix that can be applied to any data vector to extract the relevant component of the data vector"

	^ PMMatrix rows: (self jacobiTransform transform rows copyFrom:1 to: componentsNumber )
]
