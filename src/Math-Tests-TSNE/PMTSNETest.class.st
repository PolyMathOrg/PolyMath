"
I test the method of the class PMTSNE.
"
Class {
	#name : 'PMTSNETest',
	#superclass : 'TestCase',
	#category : 'Math-Tests-TSNE',
	#package : 'Math-Tests-TSNE'
}

{ #category : 'tests' }
PMTSNETest >> testComputePValues [
	| t |

	t := (PMTSNE new)
		x: (PMMatrix rows: #(#(1 2 3) #(4 5 6) #(7 8 9)));
		perplexity: 30.0.
	self assert: t computePValues closeTo: (PMMatrix rows: (Array
		with: (Array with: 0 with: 2/3 with: 2/3)
		with: (Array with: 2/3 with: 0 with: 2/3)
		with: (Array with: 2/3 with: 2/3 with: 0)))
]

{ #category : 'tests' }
PMTSNETest >> testComputePairwiseAffinities [
	| t correctAffinities |

	t := (PMTSNE new)
		x: (PMMatrix rows: #(#(0 0) #(2 2) #(2 0)));
		perplexity: 30.0.
	correctAffinities := PMMatrix rows: #(
		#(0 0.5 0.5)
		#(0.5 0 0.5)
		#(0.5 0.5 0)
		).
	self assert: t computePairwiseAffinities closeTo: correctAffinities.

	"This test case has large pairwise distances, which makes exp(-D*beta) = 0"
	t x: (PMMatrix rows: #(#(1 2 3.14) #(0 4 -43) #(-5 -9 -150) #(120 5 1))).
	correctAffinities := PMMatrix rows: #(
		#(0 0.333333 0.333333 0.333333)
		#(0.333333 0 0.333333 0.333333)
		#(0.333333 0.333333 0 0.333333)
		#(0.333333 0.333333 0.333333 0)
		).
	self assert: t computePairwiseAffinities closeTo: correctAffinities precision: 0.001
]

{ #category : 'tests' }
PMTSNETest >> testComputePairwiseDistances [
	| t |
	t := (PMTSNE
		new)
		x: (PMMatrix rows: #(#(1 2) #(3 4))).
	self assert: t computePairwiseDistances equals: (PMMatrix rows: #(#(0 8) #(8 0)))
]

{ #category : 'tests' }
PMTSNETest >> testEntropyOfAndPRowWithBeta [
	| distanceVector pVector entropy |
	"Input points are (0, 0), (2, 2) and (2, 0)"
	distanceVector := #(0 8 4) asPMVector.
	pVector := PMVector new: (distanceVector size).
	entropy := PMTSNE entropyOf: distanceVector andPRow: pVector withBeta: 2.0.
	self assert: entropy closeTo: 0.003020119571023052.
	self assert: pVector closeTo: (Array with: 0.99966454 with: 0.00000011 with: 0.00033535) asPMVector
]

{ #category : 'tests' }
PMTSNETest >> testInitialDimsSetByDefaultWithFifty [
	| t |
	t := PMTSNE
		new
		x: (PMTSNE gridDataGeneratorOf: 5);
		start.
	self assert: t initialDims equals: 50
]

{ #category : 'tests' }
PMTSNETest >> testreduceXToInputDimsUsing [
	| t |
	t := (PMTSNE new)
			x: (PMMatrix rows: #(#(0 0) #(2 2) #(2 0))).
	t reduceXToInputDimsUsing: PMPrincipalComponentAnalyserJacobiTransformation.
	self assert: (t x) closeTo: (PMMatrix rows: #(#(-0.5 -1.5) #(-0.5 1.5) #(1 0)))
]
