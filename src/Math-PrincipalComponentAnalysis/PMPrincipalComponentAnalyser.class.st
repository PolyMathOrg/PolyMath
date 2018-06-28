"
I'm implementing a principle component analysis.
Clients should first 
- create myself specifying a size which represents the number of elements on which I should be working. 
- accumulate: (give a certain amount of vectors of the elements to compare)
- then ask for the components


"
Class {
	#name : #PMPrincipalComponentAnalyser,
	#superclass : #Object,
	#instVars : [
		'accumulatorForCovarianceMatrix',
		'jacobiTransform'
	],
	#category : 'Math-PrincipalComponentAnalysis'
}

{ #category : #'instance creation' }
PMPrincipalComponentAnalyser class >> new: anInteger [
	"anInteger is the size of the elements you will accumulate: the elements you want to compare using the component analysis."
	^ self basicNew initialize: anInteger; yourself.
]

{ #category : #transformation }
PMPrincipalComponentAnalyser >> accumulate: aPMVectorOrArray [
	accumulatorForCovarianceMatrix accumulate: aPMVectorOrArray
]

{ #category : #accessing }
PMPrincipalComponentAnalyser >> components [
	"Precondition: accumulate: should have been used."

	^ self jacobiTransform evaluate
]

{ #category : #initialization }
PMPrincipalComponentAnalyser >> initialize: anInteger [
	accumulatorForCovarianceMatrix := PMCovarianceAccumulator new: anInteger
]

{ #category : #accessing }
PMPrincipalComponentAnalyser >> jacobiTransform [
	^ jacobiTransform ifNil: [ jacobiTransform := PMJacobiTransformation matrix: accumulatorForCovarianceMatrix covarianceMatrix ]
]

{ #category : #accessing }
PMPrincipalComponentAnalyser >> transformMatrix [
	"Return a matrix that can be applied to any data vector to extract the relevant component of the data vector"

	^ self jacobiTransform transform
]
