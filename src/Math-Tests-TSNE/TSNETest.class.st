Class {
	#name : #TSNETest,
	#superclass : #TestCase,
	#category : #'Math-Tests-TSNE'
}

{ #category : #tests }
TSNETest >> testComputePairwiseDistances [
	| t |
	t := (PMTSNE
		new)
		x: (PMMatrix rows: #(#(1 2) #(3 4))).
	self assert: t computePairwiseDistances equals: (PMMatrix rows: #(#(0 8) #(8 0)))
]

{ #category : #tests }
TSNETest >> testInitialDimsSetByDefaultWithFifty [
	| t |
	t := PMTSNE
		new
		x: (PMTSNE gridDataGeneratorOf: 5);
		start.
	self assert: t initialDims equals: 50
]
