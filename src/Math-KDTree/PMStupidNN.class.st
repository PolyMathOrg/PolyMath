"
`PMStupidNN` is a naive nearest neighbour search. `PMKDTree` is much faster though, if you have to do several searches. `PMStupidNN` exists only for the `PMKDTreeTest`s (and as an example, how simple it is to subclass `PMNNStore`).
"
Class {
	#name : #PMStupidNN,
	#superclass : #PMNNStore,
	#type : #variable,
	#category : #'Math-KDTree'
}

{ #category : #evaluating }
PMStupidNN >> nnSearch: aCollection i:anInt [
"search for i nearest neighbours of vector aCollection "
|d|
self sortFor: aCollection asFloatArray.
d :=self data .
anInt =1 ifTrue:[^d first ].
^d size >anInt ifTrue: [d copyFrom: 1 to: anInt]ifFalse: [d]  
  
]

{ #category : #sorting }
PMStupidNN >> sortFor: aCollection [
"sort nearest neighbours of aCollection "
|i|
self do:[:e| i :=aCollection -(e at:2) . e at: 1 put: (i*i)sum ];
	sort .
]
