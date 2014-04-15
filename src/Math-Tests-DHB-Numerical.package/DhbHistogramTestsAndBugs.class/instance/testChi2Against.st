tests
testChi2Against

self assert: ((h chi2Against: (DhbScaledProbabilityDensityFunction histogram: h against:  DhbNormalDistribution new))
			closeTo:  2.937623). 