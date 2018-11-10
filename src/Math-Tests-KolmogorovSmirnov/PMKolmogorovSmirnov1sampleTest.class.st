Class {
	#name : #PMKolmogorovSmirnov1sampleTest,
	#superclass : #TestCase,
	#instVars : [
		'nd',
		'ks'
	],
	#category : #'Math-Tests-KolmogorovSmirnov'
}

{ #category : #initialization }
PMKolmogorovSmirnov1sampleTest >> initialize [
	nd := PMNormalDistribution new.
	ks := PMKolmogorovSmirnov1Sample new
]

{ #category : #running }
PMKolmogorovSmirnov1sampleTest >> numberOfRejectionsFor: aDistribution [
	| n |
	ks populationDistribution: aDistribution.
	n := 0.
	1 to: 100 do: [ :j | 
		ks data: ((1 to: 300) collect: [ :i | nd random ]).
		(ks rejectEqualityHypothesisWithAlpha: 0.05)
			ifTrue: [ n := n + 1 ] ].
	^ n
]

{ #category : #tests }
PMKolmogorovSmirnov1sampleTest >> testCorrectPopulationProbabilistic [
	"is a probabilistic test that occasionally fails, but it should happen rarely"

	| d |
	d := self numberOfRejectionsFor: (PMNormalDistribution new: 0 sigma: 1).
	self assert: d < 20
]

{ #category : #tests }
PMKolmogorovSmirnov1sampleTest >> testRejectOfEqualityHypothesesForSampleVersusDistribution [
	nd := PMNormalDistribution new.	"--> Normal distribution( 0, 1)"
	ks := PMKolmogorovSmirnov1Sample compareData: ((1 to: 100) collect: [ :i | nd random ]) withDistribution: nd.	"--> 
	a KolmogorovSmirnov(dataSize: 100 cdf: distributionValue of Normal distribution( 0, 1))"
	self assert: (ks rejectEqualityHypothesisWithAlpha: 0.05) equals: false
]

{ #category : #tests }
PMKolmogorovSmirnov1sampleTest >> testWrongAverageProbabilistic [
	"is a probabilistic test that occasionally fails, but it should happen not too often"

	| d |
	d := self numberOfRejectionsFor: (PMNormalDistribution new: 1 sigma: 1).
	self assert: d > 97
]

{ #category : #tests }
PMKolmogorovSmirnov1sampleTest >> testWrongDistributionProbabilistic [
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
PMKolmogorovSmirnov1sampleTest >> testWrongStandardDeviationProbabilistic [
	"is a probabilistic test that occasionally fails, but it should happen rarely"

	| d |
	d := self numberOfRejectionsFor: (PMNormalDistribution new: 0 sigma: 2).
	self assert: d > 96
]
