tests
testRejectOfEqualityHypothesesForSampleVersusDistribution

	nd:= PMNormalDistribution new."--> Normal distribution( 0, 1)"
	ks :=PMKolmogorovSmirnov1Sample  compareData: ((1 to:100) collect:[:i|nd random]) withDistribution: nd."--> 
	a KolmogorovSmirnov(dataSize: 100 cdf: distributionValue of Normal distribution( 0, 1))"
	self assert: (ks rejectEqualityHypothesisWithAlpha: 0.05) = false."-->false"