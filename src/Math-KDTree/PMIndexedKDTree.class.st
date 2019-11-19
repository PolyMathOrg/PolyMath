"
IndexedKDTree returns the indices of the nearest neighbours instead of the nearest neighbours itself. additionally it returns the squared distances between the vector and its neighbours, if more than one neighbour is searched.
"
Class {
	#name : #PMIndexedKDTree,
	#superclass : #PMKDTree,
	#instVars : [
		'index'
	],
	#category : 'Math-KDTree'
}

{ #category : #'instance creation' }
PMIndexedKDTree class >> withAll: aCollectionOfCollections [
"make a KDTree from a SequenceableCollection of SequenceableCollections ,which is an ordered Collection of points in a n-dimensional space. the nearest neighbour search then returns the indices of the neighbours"
^super withAll: (aCollectionOfCollections withIndexCollect: [:v :i| Array with: i with: v ]).  
]

{ #category : #private }
PMIndexedKDTree >> add: aDistance to: aNNStore [
aNNStore add: (Array with: aDistance with: (Array with: index with: value)) .
]

{ #category : #private }
PMIndexedKDTree >> adjustValue [ 

index :=value first. 
value :=value at: 2.
]

{ #category : #evaluating }
PMIndexedKDTree >> nnSearch: aSequenceableCollection i: anInt [
"search for i nearest neighbours of vector aSequenceableCollection and return the indices; and squared distances (if i>1, at second position)"
|n|
n :=PMNNStore new: anInt .
self nnSearch: aSequenceableCollection asFloatArray near: n .
^anInt =1 ifTrue: [n data first first ] ifFalse: [n completeData collect: [:i | Array with: (i at:2) first with: i first]  ]  
]

{ #category : #private }
PMIndexedKDTree >> sort: aSequenceableCollection [
^ aSequenceableCollection sort:  [:a :b| ((a at: 2)  at: dim) < ((b at: 2) at: dim)] 
]
