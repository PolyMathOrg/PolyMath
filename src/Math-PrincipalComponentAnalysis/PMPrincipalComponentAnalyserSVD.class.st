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

	| d m pca m1 d1 irisDataFrame roassalChart scatterPlotShapes |
	
	irisDataFrame := AIDatasets loadIris.
	d := irisDataFrame columnsFrom: 1 to: 4.

	"Transform DF  as matrix"
	m := PMMatrix rows: d asArrayOfRows.

	"Data standardization (mean = 0 and variance = 1)"
	m := PMStandardizationScaler new fitAndTransform: m.

	"Compute PCA components"
	pca := PMPrincipalComponentAnalyserSVD new.
	pca componentsNumber: 2.
	pca fit: m.
	pca transformMatrix.

	m1 := pca transform: m.

	d1 := DataFrame withRows: m1 rows.
	d1
		addColumn: (irisDataFrame columnsFrom: 5 to: 5) asArrayOfColumns first
		named: 'type'.
		
	roassalChart := RSChart new
		title: 'PCA of Iris Data Frame';
		addDecoration: (RSHorizontalTick new doNotUseNiceLabel asFloat: 3);
		addDecoration: RSVerticalTick new;
		yourself.

	scatterPlotShapes := (d1 column: 'type') asSet collect: [ : type | 
		(d1 select: [ : e | e values includes: type ]) 
			addScatterPlotShapeToChart: roassalChart ].

	roassalChart padding: 10.
	scatterPlotShapes asOrderedCollection
		with: { Color red . Color green . Color blue } 
		do: [ : scatterPlotShape  : scatterPlotDotColor |
			scatterPlotShape color: scatterPlotDotColor ].

	roassalChart open.
	
	
]

{ #category : #examples }
PMPrincipalComponentAnalyserSVD class >> example2 [
	"Extract 4 columns from original data. This example uses Random colors for each flower type"

	| d m pca m1 d1 irisDataFrame |
	
	irisDataFrame := AIDatasets loadIris.
	d := irisDataFrame columnsFrom: 1 to: 4.

	"Transform DF  as matrix"
	m := PMMatrix rows: d asArrayOfRows.

	"Data standardization (mean = 0 and variance = 1)"
	m := PMStandardizationScaler new fitAndTransform: m.

	"Compute PCA components"
	pca := PMPrincipalComponentAnalyserSVD new.
	pca componentsNumber: 2.
	pca fit: m.
	pca transformMatrix.

	m1 := pca transform: m.

	d1 := DataFrame withRows: m1 rows.
	d1
		addColumn: (irisDataFrame columnsFrom: 5 to: 5) asArrayOfColumns first
		named: 'type'.
		
	d1 	
		openScatterPlotWithTitle: 'PCA of Iris data set' 
		forColumn: 'type'.

	
	
]

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
