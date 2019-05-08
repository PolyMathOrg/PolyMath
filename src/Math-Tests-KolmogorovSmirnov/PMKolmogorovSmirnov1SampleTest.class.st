Class {
	#name : #PMKolmogorovSmirnov1SampleTest,
	#superclass : #TestCase,
	#instVars : [
		'nd',
		'ks'
	],
	#category : #'Math-Tests-KolmogorovSmirnov'
}

{ #category : #running }
PMKolmogorovSmirnov1SampleTest >> numberOfRejectionsFor: aDistribution [
	| n |
	ks populationDistribution: aDistribution.
	n := 0.
	1 to: 100 do: [ :j | 
		ks data: ((1 to: 300) collect: [ :i | nd random ]).
		(ks rejectEqualityHypothesisWithAlpha: 0.05)
			ifTrue: [ n := n + 1 ] ].
	^ n
]

{ #category : #running }
PMKolmogorovSmirnov1SampleTest >> setUp [
	super setUp .
	nd := PMNormalDistribution new.
	ks := PMKolmogorovSmirnov1Sample new
]

{ #category : #tests }
PMKolmogorovSmirnov1SampleTest >> testCorrectPopulationProbabilistic [
	"is a probabilistic test that occasionally fails, but it should happen rarely"

	| d |
	d := self numberOfRejectionsFor: (PMNormalDistribution new: 0 sigma: 1).
	self assert: d < 20
]

{ #category : #tests }
PMKolmogorovSmirnov1SampleTest >> testRejectOfEqualityHypothesesForSampleVersusDistribution [
	ks := PMKolmogorovSmirnov1Sample
		compareData: ((1 to: 100) collect: [ :i | nd random ])
		withDistribution: nd.
	
	self
		assert: (ks rejectEqualityHypothesisWithAlpha: 0.05)
		equals: false
]

{ #category : #tests }
PMKolmogorovSmirnov1SampleTest >> testWrongAverageProbabilistic [
	"is a probabilistic test that occasionally fails, but it should happen not too often"

	| d |
	d := self numberOfRejectionsFor: (PMNormalDistribution new: 1 sigma: 1).
	self assert: d > 97
]

{ #category : #tests }
PMKolmogorovSmirnov1SampleTest >> testWrongDistributionProbabilistic [
	"is a probabilistic test that occasionally fails, but it should happen rarely"

	| d |
	"wrong distribution with the correct mean and sd"
	d := PMLaplaceDistribution shape: 0 scale: (1 / 2) sqrt.
	self assert: d average equals: 0.
	self assert: (d standardDeviation closeTo: 1).
	d := self numberOfRejectionsFor: d.
	self assert: d > 60
]

{ #category : #tests }
PMKolmogorovSmirnov1SampleTest >> testWrongStandardDeviationProbabilistic [
	"is a probabilistic test that occasionally fails, but it should happen rarely"

	| d |
	d := self numberOfRejectionsFor: (PMNormalDistribution new: 0 sigma: 2).
	self assert: d > 96
]
