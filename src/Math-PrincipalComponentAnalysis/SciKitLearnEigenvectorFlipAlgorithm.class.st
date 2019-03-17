"
This class uses the SciKit-Learn SVD flip algorithm to ensure the signs of the eigenvectors correlate with the trend of the data.
    Instance Variables
	u:		PMMatrix
	v:		PMMatrix

"
Class {
	#name : #SciKitLearnEigenvectorFlipAlgorithm,
	#superclass : #Object,
	#instVars : [
		'u',
		'v'
	],
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #'instance creation' }
SciKitLearnEigenvectorFlipAlgorithm class >> u: u v: v [
	^ self new
		u: u;
		v: v;
		yourself
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> computeSignsFromU [
	| maxAbsCols i maxElements |
	maxAbsCols := u abs argMaxOnColumns.
	i := 0.
	maxElements := u transpose 
		rowsCollect: [ :each | 
			i := i + 1.
			each at: (maxAbsCols at: i) ].
	^ maxElements sign asPMVector 
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> flipSign [
	"flip eigenvectors sign to enforce deterministic output"

	"U-based decision like : https://github.com/scikit-learn/scikit-learn/blob/4c65d8e615c9331d37cbb6225c5b67c445a5c959/sklearn/utils/extmath.py#L609"

	"does not work at the moment"

	| signs matrixForV |
	signs := self computeSignsFromU.
	u := u rowsCollect: [ :row | row dot: signs ].
	matrixForV := self signMatrixForV: signs.
	v := v dot: matrixForV
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> signMatrixForV: signs [
	| signsForV |
	signsForV := signs copyFrom: 1 to: v numberOfColumns.
	^ PMMatrix
		rows:
			((1 to: v numberOfRows)
				inject: OrderedCollection new
				into: [ :rows :eachRow | 
					rows add: signsForV.
					rows ])
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> u [
	^u
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> u: leftSingularVectors [
	u := leftSingularVectors 
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> v [
	^v
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> v: rightSingularVectors [
	v := rightSingularVectors.
]
