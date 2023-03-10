Class {
	#name : #PMCluster,
	#superclass : #Object,
	#instVars : [
		'accumulator',
		'previousSampleSize'
	],
	#category : #'Math-Clustering'
}

{ #category : #transformation }
PMCluster >> accumulate: aVector [

	accumulator accumulate: aVector
]

{ #category : #initialization }
PMCluster >> centerOn: aVector [

	self subclassResponsibility
]

{ #category : #information }
PMCluster >> changes [

	^ (self sampleSize - previousSampleSize) abs
]

{ #category : #transformation }
PMCluster >> collectAccumulatorResults [
	self subclassResponsibility
]

{ #category : #information }
PMCluster >> distanceTo: aVector [

	^ self subclassResponsibility
]

{ #category : #initialization }
PMCluster >> initialize [

	previousSampleSize := 0.
	^ self
]

{ #category : #testing }
PMCluster >> isInsignificantIn: aClusterFinder [

	^ self sampleSize <= aClusterFinder minimumClusterSize
]

{ #category : #testing }
PMCluster >> isUndefined [

	^ self subclassResponsibility
]

{ #category : #transformation }
PMCluster >> reset [

	previousSampleSize := self sampleSize.
	self collectAccumulatorResults.
	accumulator reset
]

{ #category : #information }
PMCluster >> sampleSize [

	^ accumulator count
]
