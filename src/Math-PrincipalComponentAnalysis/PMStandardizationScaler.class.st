Class {
	#name : #PMStandardizationScaler,
	#superclass : #PMDataTransformer,
	#instVars : [
		'accumulator'
	],
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #'as yet unclassified' }
PMStandardizationScaler >> fit: aPMMatrix [
	"Compute the mean and the scale of a PMMatrix (in order to have a std of 1)"

	accumulator := PMCovarianceAccumulator new: aPMMatrix numberOfColumns.
	aPMMatrix rowsDo: [ :each | accumulator accumulate: each ]
]

{ #category : #accessing }
PMStandardizationScaler >> mean [
	^ accumulator average
]

{ #category : #accessing }
PMStandardizationScaler >> scale [
	^ self variance collect: [ :element |
		| root |
		root := element sqrt.
		(root ~= 0) ifTrue: [ root ] ifFalse: [ 1.0 ]
		 ]
]

{ #category : #transforming }
PMStandardizationScaler >> transform: aPMMatrix [
	"Perform standardization by centering and scaling"
	
	|mean scale|
	mean := self mean.
	scale := self scale.
	^ PMMatrix rows: ((PMMatrix rows: (aPMMatrix rowsCollect: [ :each | each - mean ]))  rowsCollect: [ :each| each / scale])
]

{ #category : #information }
PMStandardizationScaler >> variance [
	"Return the diagonal of the covarianceMatrix"

	| c |
	c := accumulator covarianceMatrix.
	^ (1 to: c numberOfRows) collect: [ :each | c at: each at: each ]
]
