Class {
	#name : #PMHistogramTestsAndBugs,
	#superclass : #TestCase,
	#instVars : [
		'h'
	],
	#category : #'Math-Tests-DHB-Numerical'
}

{ #category : #comment }
PMHistogramTestsAndBugs >> readMe [
"DhbHistogram is insofar a bit problematic as for most methods it first needs the cache to be flushed by hand, but DhbHistogram is used by some other dhb objects that tend to forget to do this. hence i had to add some minimum amount of flushCache routines, so that everything works properly which is tested here (and things didnt slowdown, i made some routines a tiny bit faster). since the cache gets flushed automatically when the cache is full and the default cachesize is 100 and with 100 datapoints there is no noticable speed difference with using a cache, i would guess that the author had set the default size so low that the routines would work in most cases (but - well - just in most cases). anyway i did not change the default cache size. a real bug was corrected and tested in testCountsBetween, testAdjustDimensionUpTo and also in testDhbHistogrammedDistribution ."
]

{ #category : #running }
PMHistogramTestsAndBugs >> setUp [
h:=PMHistogram new.
h freeExtent: true.
1to:3 do: [:i |h accumulate: i].
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testAdjustDimensionUpTo [
	| a |
	a := PMHistogram new.
	a setDesiredNumberOfBins: 20.
	#(1 2 3 1 2.3 2.4) do: [ :x | a accumulate: x ].
	self assert: a count equals: 6.	"this..."
	self assert: (a countAt: 3) equals: 1	" and this did not work correctly"
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testAverage [
	self assert: h average equals: 2
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testBinWidth [
	self assert: h binWidth equals: 1 / 25
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testChi2Against [

self assert: ((h chi2Against: (PMScaledProbabilityDensityFunction histogram: h against:  PMNormalDistribution new))
			closeTo:  2.937623). 
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testCount [
	self assert: h count equals: 3
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testCountAt [
	self assert: (h countAt: 3) equals: 1
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testCountsBetween [
	self assert: (h countsBetween: 2 and: 4) equals: 2.
	"here is a bug in the original method: h countsBetween: 2 and: 3 resulted in -50"
	self assert: (h countsBetween: 2 and: 3) equals: 1.
	self assert: (h countsBetween: 1 and: 3) equals: 2.
	self assert: (h countsBetween: 2 and: 4) equals: 2.
	self assert: (h countsBetween: 1 and: 4) equals: 3.
	self assert: (h countsBetween: 2.1 and: 2.2) equals: 0.
	self assert: (h countsBetween: 2 and: 2.04) equals: 1.	"binWidth is 0.04"
	self assert: ((h countsBetween: 2 and: 2.01) closeTo: 0.25).	"hence this the correct result"
	self assert: ((h countsBetween: 2.01 and: 3) closeTo: 0.75).	"and so on..."
	self assert: ((h countsBetween: 1.01 and: 2.01) closeTo: 1).
	self assert: ((h countsBetween: 2.01 and: 2.02) closeTo: 0.25)
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testCountsUpTo [
	self assert: (h countsUpTo: 4) equals: 3.
	self assert: (h countsUpTo: 2.1) equals: 2.
	self assert: (h countsUpTo: 3) equals: 2.
	self assert: (h countsUpTo: 2) equals: 1.
	self assert: (h countsUpTo: 1.04) equals: 1.	"at 1.04 a new bin starts"
	self assert: ((h countsUpTo: 1.02) closeTo: 0.5).	"hence this is correct"
	self assert: (h countsUpTo: 1) equals: 0
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testErrorOnAverage [
self assert: (h errorOnAverage isFloat).
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testFConfidenceLevel [
	self assert: (h fConfidenceLevel: h) equals: 100.0
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testInverseDistributionValue [
	self assert: (h inverseDistributionValue: 1) equals: h maximum.
	self assert: (h inverseDistributionValue: 0) equals: h minimum
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testKurtosis [
	h accumulate: 2.
	self assert: h kurtosis equals: 3 / 2
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testLowBinLimitAt [
self assert: ((h lowBinLimitAt:2) isNumber).
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testMaximum [
self assert: ( h maximum >=3).
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testMaximumCount [
	self assert: h maximumCount equals: 1.
	h accumulate: 3.
	self assert: h maximumCount equals: 2
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testMinimum [
self assert: ( h minimum <=  1).
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testPMHistogrammedDistribution [
	| g |
	g := PMHistogrammedDistribution histogram: h.
	"this raised an error (and printOn: did not work) because #parameters was not defined:"
	self shouldnt: [ g printString ] raise: Error
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testSkewness [
	self assert: h skewness equals: 0
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testStandardDeviation [
	self assert: h standardDeviation equals: 1
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testTConfidenceLevel [
	self assert: (h tConfidenceLevel: h) equals: 0
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testTotalCount [
	self assert: h totalCount equals: 3
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testUnnormalizedVariance [
	self assert: h unnormalizedVariance equals: 2
]

{ #category : #tests }
PMHistogramTestsAndBugs >> testVariance [
	self assert: h variance equals: 1
]
