Class {
	#name : #PMKolmogorovSmirnov1SampleTest,
	#superclass : #TestCase,
	#instVars : [
		'distribution',
		'test'
	],
	#category : #'Math-Tests-Distributions-KolmogorovSmirnov'
}

{ #category : #running }
PMKolmogorovSmirnov1SampleTest >> numberOfRejectionsFor: aDistribution [
	| n |
	test populationDistribution: aDistribution.
	n := 0.
	1 to: 100 do: [ :j |
		test data: ((1 to: 300) collect: [ :i | distribution random ]).
		(test rejectEqualityHypothesisWithAlpha: 0.05)
			ifTrue: [ n := n + 1 ] ].
	^ n
]

{ #category : #running }
PMKolmogorovSmirnov1SampleTest >> setUp [
	super setUp .
	distribution := PMNormalDistribution new.
	test := PMKolmogorovSmirnov1Sample new
]

{ #category : #tests }
PMKolmogorovSmirnov1SampleTest >> testCorrectPopulationProbabilistic [
	"is a probabilistic test that occasionally fails, but it should happen rarely"

	| numberOfRejections |
	numberOfRejections := self numberOfRejectionsFor: (PMNormalDistribution new: 0 sigma: 1).
	self assert: numberOfRejections < 20
]

{ #category : #tests }
PMKolmogorovSmirnov1SampleTest >> testRejectOfEqualityHypothesesForSampleVersusDistribution [

	| sample |
	"The data below are taken from http://www.maths.qmul.ac.uk/~bb/CTS_Chapter3_Students.pdf"
	sample := #( -1.2 0.2 -0.6 0.8 -1.0 ).
	test := PMKolmogorovSmirnov1Sample compareData: sample withDistribution: distribution.

	self deny: (test rejectEqualityHypothesisWithAlpha: 0.05)
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
