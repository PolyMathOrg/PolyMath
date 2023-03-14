Class {
	#name : #PMAnotherGeneticOptimizerTest,
	#superclass : #TestCase,
	#instVars : [
		'geneticOptimizer'
	],
	#category : #'Math-Tests-FunctionFit'
}

{ #category : #running }
PMAnotherGeneticOptimizerTest >> setUp [

	| origin f |
	super setUp.
	f := [ :x |
	     | v |
	     v := x asPMVector.
	     v * v ].
	origin := #( -5 -5 -5 ).
	geneticOptimizer := PMAnotherGeneticOptimizer function: f minimumValues: origin maximumValues: origin negated.
	geneticOptimizer maximumIterations: 50.
	geneticOptimizer chromosomeManager populationSize: 20.
	geneticOptimizer chromosomeManager randomGenerator: (Random seed: 42)
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testChromosomeManager [
	self
		assert: geneticOptimizer chromosomeManager class
		equals: PMAnotherChromosomeManager.
	self assert: geneticOptimizer chromosomeManager populationSize equals: 20
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testComputePrecision [
|r|
geneticOptimizer maximumIterations: 2.
geneticOptimizer evaluate .
r:=geneticOptimizer computePrecision:0.
geneticOptimizer maximumIterations: 50 .
geneticOptimizer evaluate .
self assert: (r>geneticOptimizer computePrecision  )
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testEvaluate [

	geneticOptimizer maximumIterations: 170.
	geneticOptimizer chromosomeManager populationSize: 50.
	self assert: geneticOptimizer evaluate closeTo: #( 0 0 0 )
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testInitializeIterations [

	self assertEmpty: geneticOptimizer bestPoints.
	geneticOptimizer initializeIterations.
	self denyEmpty: geneticOptimizer bestPoints.
	geneticOptimizer calcStatistics: true.
	geneticOptimizer evaluate.
	self denyEmpty: geneticOptimizer bestValueHistory.
	geneticOptimizer initializeIterations.
	self assertEmpty: geneticOptimizer bestValueHistory
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testPrint [

	| aStream s |
	aStream := ReadWriteStream with: ''.
	geneticOptimizer printOn: aStream.
	s := aStream contents.
	self assert: (s includesSubstring: 'v * v').
	self assert: (s includesSubstring: '50').
	self assert: (s includesSubstring: '20')
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testRangeScale [

	geneticOptimizer initializeIterations.
	self assert: geneticOptimizer rangeScale first closeTo: 0.1.
	self assert: geneticOptimizer rangeScale second closeTo: 0.19473684210526315.
	geneticOptimizer initializeIterations.
	self assert: geneticOptimizer rangeScale first closeTo: 0.1.
	self assert: geneticOptimizer rangeScale second closeTo: 0.19473684210526315
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testRangeScaleProbabilistic [
	| r1 r2 correct |
	correct := 0.
	9
		timesRepeat: [
			self setUp.
			geneticOptimizer maximumIterations: 500.
			geneticOptimizer rangeScale: true.
			r1 := geneticOptimizer evaluate norm.
			self setUp.
			geneticOptimizer maximumIterations: 500.
			geneticOptimizer rangeScale: false.
			r2 := geneticOptimizer evaluate norm.
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
			geneticOptimizer maximumIterations: 1000.
			geneticOptimizer removeLast: true.
			r1 := geneticOptimizer evaluate norm.
			self setUp.
			geneticOptimizer maximumIterations: 1000.
			geneticOptimizer removeLast: false.
			r2 := geneticOptimizer evaluate norm.
			correct := r1 > r2
				ifTrue: [ correct + 1 ]
				ifFalse: [ correct - 1 ] ].
	self assert: correct > 0
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testSteadyState [
|r1 r2|
"probabilistic test. not always true"
geneticOptimizer steadyState:  false.
geneticOptimizer maximumIterations: 1000.
r1 :=geneticOptimizer evaluate norm.
self setUp .
geneticOptimizer steadyState:  true.
geneticOptimizer maximumIterations: 1000.
r2 :=geneticOptimizer evaluate norm.
self assert: (r1>r2  )
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testaddPointAt [
	| b |
	geneticOptimizer chromosomeManager populationSize: 2.
	geneticOptimizer resetBestPoints.
	geneticOptimizer addPointAt: #(0 1 0).
	b := geneticOptimizer bestPoints.
	self assert: b first position equals: #(0 1 0).
	self assert: b first value equals: 1.
	geneticOptimizer addPointAt: (Array with: 0 with: Float nan with: 0).
	self assert: geneticOptimizer bestPoints equals: b.
	geneticOptimizer addPointAt: (Array with: (0 - Float infinity) with: 0 with: 0).
	self assert: geneticOptimizer bestPoints equals: b.
	geneticOptimizer addPointAt: #(1 1 0).
	b := geneticOptimizer bestPoints.
	self assert: b size equals: 2.
	geneticOptimizer addPointAt: #(2 1 0).
	self assert: geneticOptimizer bestPoints equals: b.
	geneticOptimizer addPointAt: #(0 0.9 0).
	self assert: b first position equals: #(0 0.9 0).
	self assert: b second position equals: #(0 1 0).	"never throw away old first position"
	geneticOptimizer removeLast: true.
	geneticOptimizer addPointAt: #(0 0.89 0).
	self assert: b first position equals: #(0 0.89 0).
	self assert: b second position equals: #(0 0.9 0)
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testcalcStatistics [

	| s |
	geneticOptimizer evaluate.
	self assertEmpty: geneticOptimizer bestValueHistory.
	self assertEmpty: geneticOptimizer worstValueHistory.
	self assertEmpty: geneticOptimizer whateverHistory.
	geneticOptimizer calcStatistics: true.
	geneticOptimizer evaluate.
	s := geneticOptimizer iterations.
	self assert: geneticOptimizer bestValueHistory size equals: s.
	self assert: geneticOptimizer worstValueHistory size equals: s.
	self assert: geneticOptimizer whateverHistory size equals: s
]

{ #category : #tests }
PMAnotherGeneticOptimizerTest >> testresetBestPoints [

	geneticOptimizer evaluate.
	geneticOptimizer resetBestPoints.
	self assertEmpty: geneticOptimizer bestPoints
]
