"
NNStore stores neighbours together with distances and uses the distances for sorting. 

can easily be subclassed if one needs an Array sorted depending on some outside data. see StupidNN for a simple example and comment on ""withAll:"" or just use ""newFrom:"".
"
Class {
	#name : #PMNNStore,
	#superclass : #Array,
	#type : #variable,
	#instVars : [
		'maxDistance',
		'lastUsedIndex'
	],
	#category : 'Math-KDTree'
}

{ #category : #'instance creation' }
PMNNStore class >> new: anInt [
^((super new: anInt) atAllPut: {Float infinity. nil}  )initialize  
]

{ #category : #'instance creation' }
PMNNStore class >> newFrom: aCollectionWithSortingIndex [
"example:
( NNStore newFrom:#(#(3 1.0) #(0 '2')) ) data.   #('2' 1.0)"
^((super newFrom: aCollectionWithSortingIndex )lastUsedIndex: aCollectionWithSortingIndex size )sort  
]

{ #category : #'instance creation' }
PMNNStore class >> withAll: aCollection [
"this is the peferable form of instance creation for subclasses since freeIndex is correctly initialized this way. then 'sortFor:' must be overwritten and called at least once (!); an example is StupidNN. the other possibility is to use 'new:' and to fill NNStore subclass with 'add:' . the advantage is, that NNStore has not to be filled completely this way and the sorting logic can be applied outside of the subclass without sortFor: (see also comment on add:). 
you cant enter the sorting index with the method withAll: . if you want to do that, use 'newFrom:' instead"
^(super withAll: (aCollection collect: [:coll| {nil. coll}]))lastUsedIndex: aCollection size  
]

{ #category : #comparing }
PMNNStore >> = aNNStore [
^(self == aNNStore) or: 
	[ (self species =aNNStore species ) and:
		[(maxDistance =aNNStore maxDistance)and:
			[(self size=aNNStore size) and: 
				[self completeData  =aNNStore completeData] ] ] ]

]

{ #category : #adding }
PMNNStore >> add: distAndNeighbour [
"distAndNeighbour is a SequenceableCollection of the sorting index and the data value.
 dist, the sorting index, has to be a number. distAndNeighbour will only be added if dist is as good or better (smaller) than maxDistance. if NNStore is full, further data will be added at the last position and the last data, which must be worse than distAndNeighbour, will be overwritten."
	(maxDistance > distAndNeighbour first) ifFalse: [^self]. 
	self isFull ifFalse: [lastUsedIndex :=lastUsedIndex +1] .
	self at:  lastUsedIndex  put: distAndNeighbour.
	self isFull ifTrue: [ self sort ].
]

{ #category : #accessing }
PMNNStore >> completeData [
"return the sorted data with distance (at first place)"
|ar |
ar :=(Array new:lastUsedIndex) replaceFrom: 1 to:  lastUsedIndex with: self startingAt:  1 .
^self isFull ifTrue: [ar] ifFalse: [ar sort: [: a :b| a first < b first ] ]

]

{ #category : #copying }
PMNNStore >> copyEmpty [
	^ self species new: lastUsedIndex 
]

{ #category : #accessing }
PMNNStore >> data [
"return the sorted data"
^self completeData  collect: [:e|e at:2] 
]

{ #category : #comparing }
PMNNStore >> hash [
^self class hash bitXor: (self size hash bitXor:(maxDistance hash bitXor: self completeData hash)) 
]

{ #category : #initialization }
PMNNStore >> initialize [ 
"can also be used for resetting as eg in testEqual2"
lastUsedIndex :=0.
maxDistance := ((self size = 0) ifTrue: [ 0.0 - Float infinity ]ifFalse: [ Float infinity ]). "(self size = 0) ifTrue: is necessary here, ifEmpty wouldnt work"

]

{ #category : #testing }
PMNNStore >> isEmpty [ 
^lastUsedIndex =0
]

{ #category : #testing }
PMNNStore >> isFull [
^lastUsedIndex =self size 
]

{ #category : #private }
PMNNStore >> lastUsedIndex: anInt [
"method is only necessary for correct instance creation. not directly usable for deleting data!"
lastUsedIndex :=anInt .
]

{ #category : #accessing }
PMNNStore >> maxDistance [ 
"the maximum sorting index, if NNStore is full; if not then Infinity"
^maxDistance 
]

{ #category : #copying }
PMNNStore >> postCopy [ 
super postCopy .
lastUsedIndex :=lastUsedIndex copy.
maxDistance :=maxDistance copy.


]

{ #category : #sorting }
PMNNStore >> sort [
self ifEmpty: [^self].
self sort: [:a :b| a first < b first ] .
 maxDistance := self last first .
]

{ #category : #sorting }
PMNNStore >> sortFor: whatever [
"should be overwritten by subclasses"
"
canonical form:
self do:[:e|e at: 1 put: somethingDependingOnWhatever ].
self sort.
"
"sortFor: should not be called before the NNStore is full!"
self do:[:e|e at: 1 put: (e at: 2) ].
self sort .
]
