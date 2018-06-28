Class {
	#name : #PMMahalanobisCenter,
	#superclass : #Object,
	#instVars : [
		'center',
		'inverseCovariance',
		'accumulator'
	],
	#category : 'Math-Clustering'
}

{ #category : #creation }
PMMahalanobisCenter class >> new: anInteger [
	
	^ self new initialize: anInteger ; yourself
]

{ #category : #creation }
PMMahalanobisCenter class >> onVector: aVector [

	^ self new center: aVector
]

{ #category : #transformation }
PMMahalanobisCenter >> accumulate: aVector [
	
	accumulator accumulate: aVector
]

{ #category : #initialization }
PMMahalanobisCenter >> center: aVector [

	accumulator := PMCovarianceAccumulator new: aVector size.
	center := aVector.
	inverseCovariance := PMSymmetricMatrix identity: aVector size

]

{ #category : #transformation }
PMMahalanobisCenter >> computeParameters [

	center := accumulator average copy.
	inverseCovariance := accumulator covarianceMatrix inverse
]

{ #category : #information }
PMMahalanobisCenter >> count [
	^accumulator count
]

{ #category : #information }
PMMahalanobisCenter >> distanceTo: aVector [

	| delta |
	delta := aVector - center.
	^ delta * inverseCovariance * delta
]

{ #category : #initialization }
PMMahalanobisCenter >> initialize: anInteger [

	accumulator := PMCovarianceAccumulator new: anInteger
	
]

{ #category : #printing }
PMMahalanobisCenter >> printOn: aStream [
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	accumulator count printOn: aStream.
	aStream nextPutAll: ': '.
	center printOn: aStream.
]

{ #category : #transformation }
PMMahalanobisCenter >> reset [
	
	accumulator reset
]
