Class {
	#name : #PMClusterFinder,
	#superclass : #PMIterativeProcess,
	#instVars : [
		'dataServer',
		'dataSetSize',
		'minimumRelativeClusterSize'
	],
	#category : #'Math-Clustering'
}

{ #category : #creation }
PMClusterFinder class >> new: anInteger server: aClusterDataServer type: aClusterClass [

	^ self new
			initialize: anInteger
			server: aClusterDataServer
			type: aClusterClass;
			yourself
]

{ #category : #transformation }
PMClusterFinder >> accumulate: aVector [
	"Private - Accumulate aVector into the nearest cluster"

	(result at: (self indexOfNearestCluster: aVector)) accumulate: aVector
]

{ #category : #information }
PMClusterFinder >> clusters: aCollectionOfClusters [

	result := aCollectionOfClusters
]

{ #category : #private }
PMClusterFinder >> collectChangesAndResetClusters [

	| hasEmptyClusters changes |
	changes := 0.
	hasEmptyClusters := false.
	result do:
			[ :each |
			changes := each changes + changes.
			(each isInsignificantIn: self)
				ifTrue:
					[ each centerOn: nil.
					hasEmptyClusters := true ]
				ifFalse: [ each reset ].
			].
	hasEmptyClusters
		ifTrue: [ result := result reject: [ :each | each isUndefined ]].
	^ changes / 2
]

{ #category : #initialization }
PMClusterFinder >> dataServer: aClusterDataServer [

	dataServer := aClusterDataServer
]

{ #category : #operation }
PMClusterFinder >> evaluateIteration [
	"Perform an accumulation of the data from the server."

	dataServer reset.
	dataSetSize := 0.
	[ dataServer atEnd ]
		whileFalse: [ self accumulate: dataServer next.
					 dataSetSize := dataSetSize + 1 ].
	^ self collectChangesAndResetClusters
]

{ #category : #operation }
PMClusterFinder >> finalizeIterations [
	"Close the data server"

	dataServer close
]

{ #category : #information }
PMClusterFinder >> indexOfNearestCluster: aVector [
	"Private - Answers the index of the cluster nearest to aVector."

	| distance index |
	index := 1.
	distance := (result at: 1) distanceTo: aVector.
	2 to: result size do:
		[ :n | | x |
		  x := (result at: n) distanceTo: aVector.
		  x < distance
			ifTrue: [ distance := x.
					  index := n 	] ].
	^ index
]

{ #category : #initialization }
PMClusterFinder >> initialize: anInteger server: aClusterDataServer type: aClusterClass [

	self dataServer: aClusterDataServer.
	self clusters: ( (1 to: anInteger) collect: [ :n | aClusterClass new]).
	minimumRelativeClusterSize := 0.
	^self
]

{ #category : #initialization }
PMClusterFinder >> initializeIterations [

	dataServer open.
	result
		do: [:each | each isUndefined ifTrue: [ each centerOn: dataServer next ]]
]

{ #category : #information }
PMClusterFinder >> minimumClusterSize [
	^ (minimumRelativeClusterSize * dataSetSize) rounded
]

{ #category : #initialization }
PMClusterFinder >> minimumRelativeClusterSize: aNumber [

	minimumRelativeClusterSize := aNumber max: 0
]

{ #category : #printing }
PMClusterFinder >> printOn: aStream [

	aStream nextPutAll: 'Iterations: '.
	iterations printOn: aStream.
	result do: [ :each | aStream cr. each printOn: aStream ]
]
