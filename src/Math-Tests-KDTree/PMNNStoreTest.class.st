"
the individual tests also check and show the general way NNStore processes its data.

"
Class {
	#name : #PMNNStoreTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-KDTree'
}

{ #category : #tests }
PMNNStoreTest >> testCopy [
	"a separate copy method is necessary because of this scenario"

	| a b |
	a := PMNNStore withAll: #(1 2 4).
	b := a copy.
	self assert: b equals: a.
	self assert: b hash equals: a hash.
	b sortFor: nil.
	self deny: b = a.	"here is the problem"
	self deny: b hash = a hash
]

{ #category : #tests }
PMNNStoreTest >> testCopyEmpty [
	| n m |
	n := PMNNStore newFrom: #(#(1 $a) #(3 1.0) #(0 '2')).
	n := n copyEmpty.
	self assert: n isEmpty.
	n
		add: #(2 10);
		add: #(1 100).
	self deny: n isEmpty.
	self assert: n maxDistance equals: Float infinity.	"because it is not yet full"
	self assert: n data equals: #(100 10).
	m := n copyEmpty.
	self assert: m size equals: 2.	"size is reduced now"
	m
		add: #(2 10);
		add: #(1 100).
	self deny: m = n.
	self assert: m completeData equals: n completeData
]

{ #category : #tests }
PMNNStoreTest >> testEqual [
	| a b |
	b := #(#(1 $a) #(3 1.0) #(0 '2')).
	a := PMNNStore newFrom: b.
	self deny: a = b.
	b := PMNNStore newFrom: #(#(1 $a) #(3 1.0) #(0 2)).
	self deny: a = b.
	b := a copyEmpty.
	self deny: a = b.
	b addAll: #(#(3 1.0) #(1 $a) #(4 true) #(0 '2')).
	self assert: a equals: b.
	b add: #(2 nil).
	self deny: a = b.
	b := PMNNStore new: 3.
	a := PMNNStore new: 2.
	a add: #(2 nil).
	b add: #(2 nil).
	self deny: a = b.
	self deny: b hash = a hash
]

{ #category : #tests }
PMNNStoreTest >> testExtremeCase [
	| n |
	n := PMNNStore new.
	n sortFor: nil.	"this should indeed always be possible and shouldnt raise an error!"
	self assert: n isFull.
	n add: #(1 1).	"adding should also always be possible, although it will not be added in this case"
	self deny: n maxDistance = 1.
	n
		add: (Array with: (0 - Float infinity) with: 1).	"and this extreme case too."
	self assert: n isEmpty.
	self assert: n data equals: #().
	self should: [ n add: (Array with: nil with: 1) ] raise: Error	"but this should always raise an error (not only in NNStores with size 0), also in subclasses, otherwise one can have strange bugs"
]

{ #category : #tests }
PMNNStoreTest >> testInitialize [
	| a b |
	a := PMNNStore newFrom: #(#(4 $a) #(5 1.0) #(6 '2')).
	b := (PMNNStore newFrom: #(#(4 $a) #(5 1.0) #(6 '2'))) initialize.
	self deny: a = b.
	a initialize.
	self assert: a equals: b.
	b add: #(4 $a).
	self deny: a = b.
	a add: #(4 $a).
	self assert: a equals: b.
	a add: #(5 1.0).
	self deny: a = b
]

{ #category : #tests }
PMNNStoreTest >> testInitialize2 [
	"a separate = method is necessary because of this scenario with resetting"

	| a b c |
	a := (PMNNStore newFrom: #(#(1 $a) #(3 1.0) #(0 '2'))) initialize.	"initialize = resetting"
	b := (PMNNStore newFrom: #(#(1 $a) #(3 false) #(0 '2'))) initialize.
	self assert: a equals: b.	"first  problematic part"
	c := #(#(3 true) #(2 1)).
	a addAll: c.
	b addAll: c.
	self assert: a equals: b.	"second problematic part"
	c := #(2 nil).
	a add: c.
	self deny: a = b.
	b add: c.
	self assert: a equals: b
]

{ #category : #tests }
PMNNStoreTest >> testInitialize3 [
	| a |
	a := (PMNNStore newFrom: #(#(7 $a) #(5 1.0) #(6 '2'))) initialize.
	a
		add: #(5 1.0);
		add: #(4 $a).
	self assert: a data equals: #($a 1.0).
	self assert: a completeData equals: #(#(4 $a) #(5 1.0))
]

{ #category : #tests }
PMNNStoreTest >> testNew [
	| n |
	n := PMNNStore new: 1.
	self assert: n isEmpty.
	self assert: n data equals: #().
	self assert: n completeData equals: #().
	n add: #(1 2).
	n add: #(3 1).	"will not be added"
	self assert: n data equals: #(2)
]

{ #category : #tests }
PMNNStoreTest >> testNew2 [
	| n |
	n := PMNNStore new: 3.
	n add: #(3 1).
	n add: #(1 2).
	self deny: n isFull.
	self assert: n completeData equals: #(#(1 2) #(3 1))
]

{ #category : #tests }
PMNNStoreTest >> testNew3 [
	| n |
	n := PMNNStore new: 0.
	self assert: n isEmpty.
	self assert: n isFull.
	self assert: n equals: n copyEmpty.
	self assert: n data equals: #().
	self assert: n completeData equals: #()
]

{ #category : #tests }
PMNNStoreTest >> testNewFrom [
	| n |
	n := PMNNStore newFrom: #(#(1 $a) #(3 1.0) #(0 '2')).
	self assert: n data equals: #('2' $a 1.0).
	self assert: n isFull.
	self assert: n maxDistance equals: 3.
	n add: #(2 true).
	self assert: n maxDistance equals: 2.
	n add: #(0.5 nil).
	self assert: n maxDistance equals: 1.
	self assert: n data equals: #('2' nil $a)
]

{ #category : #tests }
PMNNStoreTest >> testWithAll [

	| n |
	n := PMNNStore withAll: #( 2 5 4 ).
	self assert: n completeData equals: #( #( nil 2 ) #( nil 5 ) #( nil 4 ) ).
	n sortFor: nil. "calling sortFor: is necessary with withAll:"
	self assert: n data equals: #( 2 4 5 ).
	self assert: n isFull.
	n add: #( 3 6 ) copy.

	"one has to be a bit carefull when one uses 
				 PMNNStore withAll:, as sortfor: changes this data. 
				 n add: #(3 6) is not possible here!"
	self assert: n data equals: #( 2 6 4 ).
	n sortFor: nil.
	self assert: n data equals: #( 2 4 6 )
]
