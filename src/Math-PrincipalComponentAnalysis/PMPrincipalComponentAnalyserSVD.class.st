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
	svd := PMSingularValueDecomposition new initialize: aPMMatrix.
	u := svd leftSingularForm.
	v := svd rightSingularForm.
	"self flipEigenvectorsSign"
	"flip does not work correctly at the moment"
]

{ #category : #accessing }
PMPrincipalComponentAnalyserSVD >> flipEigenvectorsSign [
	"flip eigenvectors sign to enforce deterministic output"
	"U-based decision like : https://github.com/scikit-learn/scikit-learn/blob/4c65d8e615c9331d37cbb6225c5b67c445a5c959/sklearn/utils/extmath.py#L609"
	
	"does not work at the moment"
	| signs maxAbsCols i |
	maxAbsCols := (u abs) argMaxOnColumns.
	i := 0.
	signs := (u rowsCollect: [ :each| i := i + 1. each at: (maxAbsCols at: i)
		]) sign.
	u := u * signs.
	v := v productWithVector: (signs copyFrom:1 to: v numberOfColumns)
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
