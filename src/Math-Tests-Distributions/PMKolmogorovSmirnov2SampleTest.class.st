Class {
	#name : #PMKolmogorovSmirnov2SampleTest,
	#superclass : #TestCase,
	#instVars : [
		'k'
	],
	#category : #'Math-Tests-Distributions-KolmogorovSmirnov'
}

{ #category : #running }
PMKolmogorovSmirnov2SampleTest >> setUp [
	super setUp .
	k := PMKolmogorovSmirnov2Sample new
]

{ #category : #tests }
PMKolmogorovSmirnov2SampleTest >> testRejectOfEqualityHypothesesForTwoSamples [
	"The data below are taken from http://www.stats.ox.ac.uk/~massa/Lecture%2013.pdf
	According to that paper Dn = 0.6 and Dcrit = 0.645 so the null hypothesis is retained.
	"

	| ks |
	ks := PMKolmogorovSmirnov2Sample compareData: #( 1.2 1.4 1.9 3.7 4.4 4.8 9.7 17.3 21.1 28.4 ) withData: #( 5.6 6.5 6.6 6.9 9.2 10.4 10.6 19.3 ).

	self assert: (ks rejectEqualityHypothesisWithAlpha: 0.05)
]

{ #category : #tests }
PMKolmogorovSmirnov2SampleTest >> testSecondSmallSample [
	"sample from Kim, P. J. & Jennrich, R. I.
	Tables of the exact sampling distribution of the two-sample Kolmogorov–Smirnov criterion
	in Selected Tables in Mathematical Statistics Volume I (1973)"

	| d1 d2 |
	d1 := #(0.723 0.382 -0.854 -1.318 0.847 -0.41 -0.111).
	d2 := #(0.558 -1.327 1.778 0.516 -1.751 -0.135 -1.292 0.846 -1.26 -1.943 -0.128 1.124 -1.813).
	k data: d1.
	k otherData: d2.
	self assert: k ksStatistic equals: 29 / 91.
	self deny: (k rejectEqualityHypothesisWithAlpha: 0.1).
	k data: d1 + 1.282.
	self assert: (k rejectEqualityHypothesisWithAlpha: 0.05).
	self assert: k ksStatistic equals: 56 / 91.
	self
		assert: (1 - k pValue asFloat roundTo: 0.000001)
		equals: 0.045820.
	self deny: (k rejectEqualityHypothesisWithAlpha: 0.01)
]

{ #category : #tests }
PMKolmogorovSmirnov2SampleTest >> testSmallSample [
	"sample from http://www.math.montana.edu/~jobo/st431/ho2b.pdf"

	| d1 d2 |
	d1 := #(20.30 22.53 25.70 13.23 29.67 24.46 26.07 19.35 17.813 16.00 15.30 32.90).
	d2 := #(10.56 28.13 19.94 11.03 8.093 12.95 21.14 32.50 10.90).
	k data: d1.
	k otherData: d2.
	self assert: (1 - k pValue asFloat roundTo: 0.00001) equals: 0.06063.
	self assert: k ksStatistic equals: 5 / 9.
	self deny: (k rejectEqualityHypothesisWithAlpha: 0.05).
	self assert: (k rejectEqualityHypothesisWithAlpha: 0.07)
]

{ #category : #tests }
PMKolmogorovSmirnov2SampleTest >> testkdStatistic [
	"extreme case"

	| d1 |
	d1 := #(20.30 22.53 25.70 13.23 29.67 24.46 26.07 19.35 17.813 16.00 15.30 32.90).
	k data: d1.
	k otherData: d1.
	self assert: k ksStatistic equals: 0
]
