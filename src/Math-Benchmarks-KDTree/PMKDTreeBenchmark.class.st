"
you can set the sequenceableCollection class of the vectors. default is FloatArray ( eg when using run: ), which is the fastest for nnSearches (because of its use of primitives), although the building of the tree is slower than with other collection types. 
example:
KDTreeBenchmark run:5 with: OrderedCollection . 	""Print it""

"
Class {
	#name : #PMKDTreeBenchmark,
	#superclass : #SMarkSuite,
	#instVars : [
		'rand',
		'bTree',
		'aTree',
		'r',
		'collType',
		'm'
	],
	#category : 'Math-Benchmarks-KDTree'
}

{ #category : #defaults }
PMKDTreeBenchmark class >> defaultProblemSize [
"the number of nearest neighbour searches in a given tree"
	^ 20
]

{ #category : #benchmarking }
PMKDTreeBenchmark class >> fastRun: nIterations with: aSequentalCollectionClass [
"omits the slow StupidNNSearch, that generally isnt interesting"
|b|
(b:=self new) 
	selectedBenchmarks: 
		{ #benchBuildTree1Dim. #benchBuildTree4Dim. #benchSearchTree1Dim. #benchSearchTree4Dim};
	collType: aSequentalCollectionClass .
^self defaultRunner execute: b with: nIterations. 

]

{ #category : #benchmarking }
PMKDTreeBenchmark class >> run: nIterations with: aSequentalCollectionClass [
|b|
(b:=self new) collType: aSequentalCollectionClass .
^self defaultRunner execute: b with: nIterations. 
]

{ #category : #benchmarking }
PMKDTreeBenchmark >> benchBuildAndSearchStupidNN1Dim [
	| n s |
	s := PMStupidNN withAll: r.
	1 to: self class defaultProblemSize do: [ :v | 
		n := 1.0 / v.
		s nnSearch: (collType with: n) i: 10 ]
]

{ #category : #benchmarking }
PMKDTreeBenchmark >> benchBuildAndSearchStupidNN4Dim [
	| n s |
	s := PMStupidNN withAll: m.
	1 to: self class defaultProblemSize do: [ :v | 
		n := 1.0 / v.
		s
			nnSearch:
				(collType
					with: n
					with: n
					with: n
					with: n)
			i: 10 ]
]

{ #category : #benchmarking }
PMKDTreeBenchmark >> benchBuildTree1Dim [
	bTree :=PMIndexedKDTree withAll: r.
]

{ #category : #benchmarking }
PMKDTreeBenchmark >> benchBuildTree4Dim [
	aTree :=PMIndexedKDTree withAll: m.
]

{ #category : #benchmarking }
PMKDTreeBenchmark >> benchSearchTree1Dim [
	| n |
	1 to: self class defaultProblemSize do: [ :v | 
		n := 1.0 / v.
		bTree nnSearch: (collType with: n) i: 10 ]
]

{ #category : #benchmarking }
PMKDTreeBenchmark >> benchSearchTree4Dim [
	| n |
	1 to: self class defaultProblemSize do: [ :v | 
		n := 1.0 / v.
		aTree
			nnSearch:
				(collType
					with: n
					with: n
					with: n
					with: n)
			i: 10 ]
]

{ #category : #accessing }
PMKDTreeBenchmark >> collType: aSequencableCollectionClass [
	^ collType := aSequencableCollectionClass
]

{ #category : #'initialize-release' }
PMKDTreeBenchmark >> initialize [
	super initialize.
	collType := FloatArray.
	rand := Random new
]

{ #category : #running }
PMKDTreeBenchmark >> instanceVariablesToPreserve [
	^ #(runner collType rand)
]

{ #category : #accessing }
PMKDTreeBenchmark >> selectedBenchmarks: aCollectionOfSymbols [
	selectedBenchmarks := IdentitySet newFrom: aCollectionOfSymbols
]

{ #category : #running }
PMKDTreeBenchmark >> setUp [
	r := (rand next: 2000) asOrderedCollection collect: [ :n | collType with: n ].
	m := (1 to: 2000) asOrderedCollection collect: [ :n | collType newFrom: (rand next: 4) ].
	aTree := PMIndexedKDTree withAll: m.
	bTree := PMIndexedKDTree withAll: r
]
