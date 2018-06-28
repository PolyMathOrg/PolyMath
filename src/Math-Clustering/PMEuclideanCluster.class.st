Class {
	#name : #PMEuclideanCluster,
	#superclass : #PMCluster,
	#instVars : [
		'center'
	],
	#category : 'Math-Clustering'
}

{ #category : #initialization }
PMEuclideanCluster >> centerOn: aVector [
	
	center := aVector.
	accumulator := PMVectorAccumulator new: (aVector ifNil:[0]ifNotNil:[ aVector size ])
]

{ #category : #transformation }
PMEuclideanCluster >> collectAccumulatorResults [

	center := accumulator average copy
]

{ #category : #information }
PMEuclideanCluster >> distanceTo: aVector [
	
	^(aVector - center) norm
]

{ #category : #testing }
PMEuclideanCluster >> isUndefined [
	
	^ center isNil
]

{ #category : #printing }
PMEuclideanCluster >> printOn: aStream [
	
	accumulator count printOn: aStream.
	aStream nextPutAll: ': '.
	center printOn: aStream
]
