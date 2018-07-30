Class {
	#name : #PMStandardizationScaler,
	#superclass : #PMDataTransformer,
	#instVars : [
		'accumulator'
	],
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #'as yet unclassified' }
PMStandardizationScaler >> fit: aCollection [
	"Compute the mean and the scale of a Collection (in order to have a std of 1)"

	accumulator := PMCovarianceAccumulator new: aCollection first size.
	aCollection do: [ :each | accumulator accumulate: each ]
]

{ #category : #accessing }
PMStandardizationScaler >> mean [
	^ accumulator average
]

{ #category : #'as yet unclassified' }
PMStandardizationScaler >> scale [
	^ self variance sqrt
]

{ #category : #transforming }
PMStandardizationScaler >> transform: aCollection [
	"Perform standardization by centering and scaling"

]

{ #category : #'as yet unclassified' }
PMStandardizationScaler >> variance [
	"Return the diagonal of the covarianceMatrix"

	| c |
	c := accumulator covarianceMatrix.
	^ (1 to: c numberOfRows) collect: [ :each | c at: each at: each ]
]
