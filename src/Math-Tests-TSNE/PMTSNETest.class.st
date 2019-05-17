"
I test the method of the class PMTSNE.
"
Class {
	#name : #PMTSNETest,
	#superclass : #TestCase,
	#category : #'Math-Tests-TSNE'
}

{ #category : #tests }
PMTSNETest >> testComputePairwiseDistances [
	| t |
	t := (PMTSNE
		new)
		x: (PMMatrix rows: #(#(1 2) #(3 4))).
	self assert: t computePairwiseDistances equals: (PMMatrix rows: #(#(0 8) #(8 0)))
]

{ #category : #tests }
PMTSNETest >> testEntropyOfAndPRowWithBeta [
	| distanceVector pVector entropy |
	"Input points are (0, 0), (2, 2) and (2, 0)"
	distanceVector := #(0 8 4) asPMVector.
	pVector := PMVector new: (distanceVector size).	
	entropy := PMTSNE entropyOf: distanceVector andPRow: pVector withBeta: 2.0.
	self assert: entropy closeTo: 0.003020119571023052.
	self assert: pVector closeTo: { 0.99966454 . 0.00000011 . 0.00033535 } asPMVector.
	
]

{ #category : #tests }
PMTSNETest >> testInitialDimsSetByDefaultWithFifty [
	| t |
	t := PMTSNE
		new
		x: (PMTSNE gridDataGeneratorOf: 5);
		start.
	self assert: t initialDims equals: 50
]
