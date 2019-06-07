Class {
	#name : #PMGaussianGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #utilities }
PMGaussianGeneratorTest >> checkDistributionOf: aGenerator withExpectedMeans: e andExpectedStandardDeviation: sd [
	"fixme: this test ignores the standard deviation and occasionally fails"
	| sample sampleMean |
	sample := PMRandomSample ofSize: 10000 usingGenerator: aGenerator.
	sampleMean := sample average.
	self assert: (e - sampleMean) abs <= 0.2.
	self assert: (sample stdev - sd) abs <= 1
]

{ #category : #tests }
PMGaussianGeneratorTest >> testDistribution [
	| mean standardDeviation g |
	mean := 147.
	standardDeviation := 17.
	g := PMGaussianGenerator new.
	g
		mean: mean;
		standardDeviation: standardDeviation;
		generator: PMLinearCongruentialRandomGenerator new.
	g generator seed: 42.

	self
		checkDistributionOf: g
		withExpectedMeans: mean
		andExpectedStandardDeviation: standardDeviation.
	"Replicated test in a different place"
	mean := 0.
	standardDeviation := 10.
	g
		mean: mean;
		standardDeviation: standardDeviation.
	self
		checkDistributionOf: g
		withExpectedMeans: mean
		andExpectedStandardDeviation: standardDeviation
]
