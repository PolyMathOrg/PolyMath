Class {
	#name : #PMAnotherGeneticOptimizerTest,
	#superclass : #TestCase,
	#instVars : [
		'go'
	],
	#category : #'Math-Tests-FunctionFit'
}

{ #category : #running }
PMAnotherGeneticOptimizerTest >> setUp [ 
|origin f|
f:=[:x| |v| v:=x asPMVector . v*v].
origin:= #(-5 -5 -5).
go:= PMAnotherGeneticOptimizer function: f minimumValues: origin maximumValues: origin negated .
go maximumIterations: 50.
go chromosomeManager populationSize: 20.
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testChromosomeManager [
	self
		assert: go chromosomeManager class
		equals: PMAnotherChromosomeManager.
	self assert: go chromosomeManager populationSize equals: 20
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testComputePrecision [
|r|
go maximumIterations: 2.
go evaluate .
r:=go computePrecision:0.
go maximumIterations: 50 .
go evaluate .
self assert: (r>go computePrecision  ).

]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testEvaluate [
go maximumIterations: 170.
go chromosomeManager populationSize: 50.
self assert: (go evaluate equalsTo: #(0 0 0)  ).

]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testInitializeIterations [
self assert: (go bestPoints isEmpty ).
go initializeIterations .
self deny: (go bestPoints isEmpty ). 
go calcStatistics: true.
go evaluate .
self deny: (go bestValueHistory isEmpty  ).
go initializeIterations .
self assert: (go bestValueHistory isEmpty  ).



]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testPrint [
|aStream  s|
aStream :=ReadWriteStream with:''.
go printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: 'v * v').
self assert: (s includesSubstring: '50').
self assert: (s includesSubstring: '20').
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testRangeScale [
go initializeIterations.
self assert: (go rangeScale first equalsTo: 0.1).
self assert: (go rangeScale second equalsTo: 0.19473684210526315).
go initializeIterations.
self assert: (go rangeScale first equalsTo: 0.1).
self assert: (go rangeScale second equalsTo: 0.19473684210526315).

]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testRangeScaleProbabilistic [
	| r1 r2 correct |
	correct := 0.
	9
		timesRepeat: [ 
			self setUp.
			go maximumIterations: 500.
			go rangeScale: true.
			r1 := go evaluate norm.
			self setUp.
			go maximumIterations: 500.
			go rangeScale: false.
			r2 := go evaluate norm.
			correct := r1 < r2
				ifTrue: [ correct + 1 ]
				ifFalse: [ correct - 1 ] ].
	self assert: correct > 0
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testRemoveLastProbabilistic [
	| r1 r2 correct |
	correct := 0.
	3
		timesRepeat: [ 
			self setUp.
			go maximumIterations: 1000.
			go removeLast: true.
			r1 := go evaluate norm.
			self setUp.
			go maximumIterations: 1000.
			go removeLast: false.
			r2 := go evaluate norm.
			correct := r1 > r2
				ifTrue: [ correct + 1 ]
				ifFalse: [ correct - 1 ] ].
	self assert: correct > 0
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testSteadyState [
|r1 r2|
"probabilistic test. not always true"
go steadyState:  false.
go maximumIterations: 1000.
r1 :=go evaluate norm.
self setUp .
go steadyState:  true.
go maximumIterations: 1000.
r2 :=go evaluate norm.
self assert: (r1>r2  ).

]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testaddPointAt [
	| b |
	go chromosomeManager populationSize: 2.
	go resetBestPoints.
	go addPointAt: #(0 1 0).
	b := go bestPoints.
	self assert: b first position equals: #(0 1 0).
	self assert: b first value equals: 1.
	go
		addPointAt:
			{0.
			Float nan.
			0}.
	self assert: go bestPoints equals: b.
	go
		addPointAt:
			{(0 - Float infinity).
			0.
			0}.
	self assert: go bestPoints equals: b.
	go addPointAt: #(1 1 0).
	b := go bestPoints.
	self assert: b size equals: 2.
	go addPointAt: #(2 1 0).
	self assert: go bestPoints equals: b.
	go addPointAt: #(0 0.9 0).
	self assert: b first position equals: #(0 0.9 0).
	self assert: b second position equals: #(0 1 0).	"never throw away old first position"
	go removeLast: true.
	go addPointAt: #(0 0.89 0).
	self assert: b first position equals: #(0 0.89 0).
	self assert: b second position equals: #(0 0.9 0)
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testcalcStatistics [
	| s |
	go evaluate.
	self assert: go bestValueHistory isEmpty.
	self assert: go worstValueHistory isEmpty.
	self assert: go whateverHistory isEmpty.
	go calcStatistics: true.
	go evaluate.
	s := go iterations.
	self assert: go bestValueHistory size equals: s.
	self assert: go worstValueHistory size equals: s.
	self assert: go whateverHistory size equals: s
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testresetBestPoints [
go evaluate .
go resetBestPoints .
self assert: (go bestPoints isEmpty  ).

]
