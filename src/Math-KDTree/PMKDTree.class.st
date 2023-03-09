"
`PMKDTree` is a space partitioning data structure to store points of that space with ""KDTree withAll: aCollectionOfVectors"", where a vector can be any collection of numbers that understands ""at:"". you can then find nearest neighbours of aVector with ""nnSearch: aVector i: numberOfNearestNeighbours"".   
"
Class {
	#name : #PMKDTree,
	#superclass : #Object,
	#instVars : [
		'left',
		'right',
		'dim',
		'value'
	],
	#category : #'Math-KDTree'
}

{ #category : #'instance creation' }
PMKDTree class >> withAll: aCollectionOfCollections [
"make a KDTree from a Collection of SequenceableCollections ,which is a Collection of points in a n-dimensional space"
(aCollectionOfCollections allSatisfy: [:c|c isCollection ])ifFalse: 			"isSequenceable does not work here in a simple way"
	[self error: 'KDTree withAll: expects a collection of collections'].
aCollectionOfCollections first ifEmpty: [self error: 'KDTree withAll: error'  ].
^self new addData: aCollectionOfCollections asOrderedCollection at:1.
]

{ #category : #private }
PMKDTree >> add: aDistance to: aNNStore [
aNNStore add: (Array with: aDistance with: value)
]

{ #category : #initialize }
PMKDTree >> addData: aSequenceableCollection at: dimension [
|sorted cut nextDimension|
dim :=dimension .
aSequenceableCollection size =1 ifTrue: [value :=aSequenceableCollection first . self adjustValue . ^self ].
sorted :=self sort: aSequenceableCollection .
cut :=sorted size + 1// 2.
value :=sorted at: cut .
self adjustValue .
nextDimension :=dimension  \\(value size) +1.
cut >1 ifTrue: [left :=self class new addData: (sorted copyFrom: 1 to: cut -1 )  at: nextDimension].
right :=self class new addData: (sorted copyFrom: cut +1 to: sorted size)  at: nextDimension
]

{ #category : #private }
PMKDTree >> adjustValue [
	"necessary for IndexedKDTree "
]

{ #category : #accessing }
PMKDTree >> farChild: aVector [
^((value at: dim) < (aVector at: dim)) ifTrue: [left ] ifFalse:   [right ]
]

{ #category : #accessing }
PMKDTree >> nearChild: aVector [
^((value at: dim) < (aVector at: dim)) ifTrue: [right ] ifFalse:   [left ]
]

{ #category : #evaluating }
PMKDTree >> nnSearch: aSequenceableCollection i: anInt [
"search for i nearest neighbours of vector aSequenceableCollection and return the vectors "
|n|
n :=PMNNStore new: anInt .
self nnSearch: aSequenceableCollection asFloatArray near: n .
n :=n data .
^anInt =1 ifTrue: [n first ] ifFalse:   [n]
]

{ #category : #private }
PMKDTree >> nnSearch: aSequenceableCollection near: aNNStore [
	| dist |
	(self nearChild: aSequenceableCollection)
		ifNotNil: [ :c | c nnSearch: aSequenceableCollection near: aNNStore ].
	aNNStore maxDistance
		< ((dist := (value at: dim) - (aSequenceableCollection at: dim)) * dist)
		ifTrue: [ ^ self ].
	dist := ((dist := aSequenceableCollection - value) * dist) sum.
	self add: dist to: aNNStore.
	(self farChild: aSequenceableCollection)
		ifNotNil: [ :c | c nnSearch: aSequenceableCollection near: aNNStore ]
]

{ #category : #printing }
PMKDTree >> printOn: aStream [
      super printOn: aStream .
	aStream nextPutAll:  ' (dim: ';
	 print: dim ;
	 nextPutAll:  ' value: ';
	 print: value ;
	 nextPutAll: ' left: ';
	 print: left ;
	 nextPutAll: ' right: ';
	 print: right ;
	 nextPut: $)
]

{ #category : #private }
PMKDTree >> sort: aSequenceableCollection [
^ aSequenceableCollection sort:  [:a :b| (a  at: dim) < (b at: dim)]
]
