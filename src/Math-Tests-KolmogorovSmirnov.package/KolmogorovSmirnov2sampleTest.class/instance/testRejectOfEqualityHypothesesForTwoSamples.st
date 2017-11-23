tests
testRejectOfEqualityHypothesesForTwoSamples
|nd ks|
	nd:= PMNormalDistribution new.
	ks :=PMKolmogorovSmirnov2Sample  
		compareData: ((1 to:100) collect:[:i|nd random]) 
		withData: ((1 to:100) collect:[:i|nd random]). "-->
	a KolmogorovSmirnov2Sample(dataSize: 100 otherDataSize: 100)"
	ks ksStatistic . "-->(9/100)"
	ks pValue asFloat ."-->0.18458528753386905"
	self assert: (ks rejectEqualityHypothesisWithAlpha: 0.05) = false"-->false"