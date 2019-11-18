"
KDTreeTest makes random checks of KDTree, comparing results with results of StupidNN. is not too fast.
"
Class {
	#name : #PMKDTreeTest,
	#superclass : #TestCase,
	#instVars : [
		'rand',
		'stupid',
		'tree'
	],
	#category : #'Math-Tests-KDTree'
}

{ #category : #running }
PMKDTreeTest >> equalityTest: aResult and: bResult [
"tests whether two collections of collections are equal"
self assert:  ( (aResult  with: bResult   collect: [:a :b|a hasEqualElements: b])  allSatisfy: [:e|e])
]

{ #category : #running }
PMKDTreeTest >> initializeTreeWith: aCollection as: simpleTree [ 
"used to initialize all tests"
stupid :=PMStupidNN withAll: aCollection.
tree := simpleTree ifTrue: [ PMKDTree withAll: aCollection ] ifFalse: [PMIndexedKDTree  withAll: aCollection ].
]

{ #category : #running }
PMKDTreeTest >> setUp [
	rand := Random new
]

{ #category : #tests }
PMKDTreeTest >> testBenchmark [
	| aStream s |
	aStream := ReadWriteStream with: ''.
	(PMKDTreeBenchmark fastRun: 1 with: Array) printOn: aStream.
	s := aStream contents.
	self assert: (s allRangesOfSubstring: 'Benchmark') size equals: 5.
	aStream := ReadWriteStream with: ''.
	(PMKDTreeBenchmark run: 1 with: OrderedCollection) printOn: aStream.
	s := aStream contents.
	self assert: (s allRangesOfSubstring: 'Benchmark') size equals: 7
]

{ #category : #tests }
PMKDTreeTest >> testIndexedKDTree1Dimension [
	| m aVector aResult bResult |
	m := (rand next: 200) collect: [:n | Array with: n].  "1-dimensional data, just some numbers"
	self initializeTreeWith: m as: false.
	1 to: 11 do: [:v | aVector := Array with: 1 / v asFloat.
		aResult := stupid nnSearch: aVector i: 3.			"3 nearest numbers to aVector "
		bResult := m atAll: ((tree nnSearch: aVector i: 3) collect: [:a | a first]).	
		self equalityTest: aResult and: bResult].
	]

{ #category : #tests }
PMKDTreeTest >> testIndexedKDTree4Dimensions [
	| m aVector aResult bResult |
	m := (1 to: 2000) collect: [:n | (rand next: 4) - 0.5].		"4-dimensional data"
	self initializeTreeWith: m as: false.
	50 timesRepeat: [aVector := (rand next: 4) - 0.5.
		aResult := stupid nnSearch: aVector i: 2.			"2 nearest neighbours"
		bResult := m atAll: ((tree nnSearch: aVector i: 2)collect: [:a | a first]).
		self equalityTest: aResult and: bResult]. 

]

{ #category : #tests }
PMKDTreeTest >> testIndexedKDTreeExtremeCase [
	| bResult |
	tree := PMIndexedKDTree withAll: #(#(1)).	"extreme case"
	bResult := tree nnSearch: #(-1) i: 3.
	self assert: bResult size equals: 1.
	self assert: bResult first equals: #(1 4)	"index 1, squared distance 4"
]

{ #category : #tests }
PMKDTreeTest >> testIndexedKDTreeSimple [
	| r n aTree bTree |
	r := rand next: 200.
	aTree := PMIndexedKDTree
		withAll: (r collect: [ :i | FloatArray with: i with: i ]).	"2-dimensional data"
	bTree := PMIndexedKDTree
		withAll: (r collect: [ :i | FloatArray with: i ]).	"1-dimensional data"
	1 to: 20 do: [ :v | 
		n := 1 / v.
		self
			assert: (aTree nnSearch: (Array with: n with: n) i: 1)
			equals: (bTree nnSearch: (Array with: n) i: 1) ]
]

{ #category : #tests }
PMKDTreeTest >> testKDTree1Dimension [
	| m aVector aResult bResult |
	m :=(rand next: 200) collect: [:n | Array with: n].	"1-dimensional data, just some numbers"
	self initializeTreeWith: m as: true .
	1 to: 11 do: [:v | aVector := Array with: 1 / v asFloat.
		aResult := stupid nnSearch: aVector i: 3.				"3 nearest numbers to aVector "
		bResult := tree nnSearch: aVector i: 3.							
		self equalityTest: aResult and: bResult].
	]

{ #category : #tests }
PMKDTreeTest >> testKDTree1DimensionIntegers [
	| m aVector aResult bResult |
	m := (1 to: 20) collect: [:index | Array with: (rand nextInt: 10)].	"only integers, obviously with multiples. test distances because the nearest neighbours are not necessarily the same"
	self initializeTreeWith: m as: true.
	0 to: 11 do:[:v | aVector := Array with: v.
		aResult :=(aVector first - (stupid nnSearch: aVector i: 3)) abs.		"distances between 3 nearest numbers and aVector "
		bResult :=(aVector first - (tree nnSearch: aVector i: 3)) abs.		"distances using KDTree"
		self equalityTest: aResult and: bResult ]  .
	]

{ #category : #tests }
PMKDTreeTest >> testKDTree2Dimensions [
|aVector aResult bResult|
self initializeTreeWith: ((1 to: 2000) collect:   [:n| (rand next:2)]) as: true .	"2-dimensional data"
100 timesRepeat: [aVector :=rand next:2.
	aResult :=stupid nnSearch: aVector  i:3.
	bResult :=tree nnSearch: aVector  i:3.
	self equalityTest: aResult and: bResult  ] . 
]

{ #category : #tests }
PMKDTreeTest >> testKDTree4Dimensions [
|aVector|
self initializeTreeWith: ((1 to: 2000) collect:   [:n| (rand next:4)-0.5]) as: true . 	"4-dimensional data"
50 timesRepeat: [aVector :=(rand next: 4)- 0.5.								"2 nearest neighbours"
	self equalityTest: (stupid nnSearch: aVector  i:2) and: (tree nnSearch: aVector  i:2)  ] . 
50 timesRepeat: [aVector :=(rand next: 4)-0.5.									"just 1 nearest neighbour"
	self assert: ( (stupid nnSearch: aVector  i:1)  hasEqualElements: (tree nnSearch: aVector  i:1) )    ] .  
]

{ #category : #tests }
PMKDTreeTest >> testKDTreeExtremeCase [
	| bResult |
	tree := PMKDTree withAll: #(#(1)).
	bResult := tree nnSearch: #(2) i: 3.
	self assert: bResult size equals: 1.
	self assert: bResult first equals: #(1).
	self should: [ PMKDTree withAll: #() ] raise: Exception.
	self should: [ PMKDTree withAll: #(2) ] raise: Exception.
	self should: [ PMKDTree withAll: #(#(2) #('v')) ] raise: Exception.
	self should: [ PMKDTree withAll: #(#(2) #()) ] raise: Exception.
	self should: [ PMKDTree withAll: #(#()) ] raise: Exception
]

{ #category : #tests }
PMKDTreeTest >> testPMVectorCompatibility [
	| aVector bVector r |
	(Array lookupSelector: #asPMVector)
		ifNil: [ ^ self skip: 'necessary PM package not loaded' ].
	aVector := #(0) asPMVector.
	bVector := #(-2.0) asPMVector.
	r := (Array with: aVector with: #(-5.0) asPMVector with:  bVector) asPMVector.
	self initializeTreeWith: r as: true.
	self
		assert: (tree nnSearch: bVector i: 2)
		equals: (Array with: bVector with: aVector).
	self
		assert: (stupid nnSearch: bVector i: 2)
		equals: (Array with: bVector with: aVector).
	self initializeTreeWith: r as: false.
	r := tree nnSearch: bVector i: 2.
	self assert: r first equals: #(3 0.0).
	self assert: r second first equals: 1.
	self assert: (r second second closeTo: 4.0)
]

{ #category : #tests }
PMKDTreeTest >> testPrintOn [
	| aStream s |
	aStream := ReadWriteStream with: ''.
	(PMKDTree withAll: #(#(1) #(4))) printOn: aStream.
	s := aStream contents.
	self assert: (s findString: 'a PMKDTree') equals: 1.
	self assert: (s allRangesOfSubstring: 'nil') size equals: 3.	"3 empty leafs should be printed"
	self assert: (s allRangesOfSubstring: '1') size equals: 3.	"twice dimension 1, once value 1"
	self assert: (s allRangesOfSubstring: '4') size equals: 1
]

{ #category : #tests }
PMKDTreeTest >> testPrintOn2 [
	| aStream s |
	aStream := ReadWriteStream with: ''.
	(PMIndexedKDTree withAll: #(#(1))) printOn: aStream.
	s := aStream contents.
	self assert: (s findString: 'a PMIndexedKDTree') equals: 1.
	self assert: (s allRangesOfSubstring: '1') size equals: 2
]
