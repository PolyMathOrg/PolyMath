tests
testSecondSmallSample
	"sample from 
Kim, P. J. & Jennrich, R. I. 
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