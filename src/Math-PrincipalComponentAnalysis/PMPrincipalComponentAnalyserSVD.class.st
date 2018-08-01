Class {
	#name : #PMPrincipalComponentAnalyserSVD,
	#superclass : #PMPrincipalComponentAnalyser,
	#instVars : [
		'svd'
	],
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #accessing }
PMPrincipalComponentAnalyserSVD >> fit: aPMMatrix [
	svd := PMSingularValueDecomposition new initialize: aPMMatrix.
]

{ #category : #accessing }
PMPrincipalComponentAnalyserSVD >> transform: aPMMatrix [
	"Apply dimensionality reduction to aPMMatrix"

	^ aPMMatrix * self transformMatrix transpose
]

{ #category : #accessing }
PMPrincipalComponentAnalyserSVD >> transformMatrix [
	"Return a matrix that can be applied to any data vector to extract the relevant component of the data vector"

	^ PMMatrix rows: (svd rightSingularForm rows copyFrom:1 to: componentsNumber )
]
