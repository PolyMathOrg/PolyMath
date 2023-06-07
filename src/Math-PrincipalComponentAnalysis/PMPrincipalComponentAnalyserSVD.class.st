Class {
	#name : #PMPrincipalComponentAnalyserSVD,
	#superclass : #PMPrincipalComponentAnalyser,
	#instVars : [
		'svd',
		'u',
		'v'
	],
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #accessing }
PMPrincipalComponentAnalyserSVD >> fit: aPMMatrix [

	svd := aPMMatrix decomposeSV.
	u := svd leftSingularMatrix.
	v := svd rightSingularMatrix.
	self flipEigenvectorsSign
]

{ #category : #accessing }
PMPrincipalComponentAnalyserSVD >> flipEigenvectorsSign [
	"flip eigenvectors sign to enforce deterministic output"
	"U-based decision like : https://github.com/scikit-learn/scikit-learn/blob/4c65d8e615c9331d37cbb6225c5b67c445a5c959/sklearn/utils/extmath.py#L609"

	| algo |
	algo := PMSciKitLearnSVDFlipAlgorithm flipU: u andV: v.

	u := algo uFlipped .
	v := algo vFlipped .
]

{ #category : #accessing }
PMPrincipalComponentAnalyserSVD >> transform: aPMMatrix [
	"Apply dimensionality reduction to aPMMatrix"

	^ aPMMatrix * self transformMatrix transpose
]

{ #category : #accessing }
PMPrincipalComponentAnalyserSVD >> transformMatrix [
	"Return a matrix that can be applied to any data vector to extract the relevant component of the data vector"

	^ PMMatrix rows: (v rows copyFrom: 1 to: componentsNumber)
]
