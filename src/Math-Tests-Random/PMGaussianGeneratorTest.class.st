Class {
	#name : #PMGaussianGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #utilities }
PMGaussianGeneratorTest >> assertSampleWithDistributionOf: aGenerator convergesToExpectedValue: expectedValue andStandardDeviation: stdDeviation [
	"fixme: this test ignores the standard deviation and occasionally fails"
	| sample sampleMean |
	sample := PMRandomSample ofSize: 10000 usingGenerator: aGenerator.
	sampleMean := sample average.
	self assert: (expectedValue - sampleMean) abs <= 0.2.
	self assert: (sample stdev - stdDeviation) abs <= 1
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
		assertSampleWithDistributionOf: g
		convergesToExpectedValue: mean
		andStandardDeviation: standardDeviation.
	"Replicated test in a different place"
	mean := 0.
	standardDeviation := 10.
	g
		mean: mean;
		standardDeviation: standardDeviation.
	self
		assertSampleWithDistributionOf: g
		convergesToExpectedValue: mean
		andStandardDeviation: standardDeviation
]
