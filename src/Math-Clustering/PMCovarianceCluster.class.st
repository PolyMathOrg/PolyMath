Class {
	#name : #PMCovarianceCluster,
	#superclass : #PMCluster,
	#category : #'Math-Clustering'
}

{ #category : #initialization }
PMCovarianceCluster >> centerOn: aVector [

	accumulator := aVector ifNotNil: [ PMMahalanobisCenter onVector: aVector ]
]

{ #category : #transformation }
PMCovarianceCluster >> collectAccumulatorResults [

	accumulator computeParameters
]

{ #category : #information }
PMCovarianceCluster >> distanceTo: aVector [

	^ accumulator distanceTo: aVector
]

{ #category : #testing }
PMCovarianceCluster >> isUndefined [

	^accumulator isNil
]

{ #category : #printing }
PMCovarianceCluster >> printOn: aStream [

	accumulator printOn: aStream
]
