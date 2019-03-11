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

{ #category : #examples }
PMPrincipalComponentAnalyserSVD class >> example1 [

"Extract 4 columns from original data"
| d m pca m1 d1 |
d := (DataFrame loadIris) columnsFrom: 1 to: 4.

"Transform DF  as matrix"
m := PMMatrix rows: (d asArrayOfRows).

"Data standardization (mean = 0 and variance = 1)"
m := (PMStandardizationScaler new) fitAndTransform: m.

"Compute PCA components"
pca := PMPrincipalComponentAnalyserSVD    new.
pca componentsNumber: 2.
pca fit: m.
pca transformMatrix.

m1 := pca transform: m.

d1 := DataFrame fromRows: m1 rows.
d1 addColumn: ((DataFrame loadIris) columnsFrom:5 to:5) asArrayOfColumns first named:''.
d1 scatterplotMatrix.
]

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
