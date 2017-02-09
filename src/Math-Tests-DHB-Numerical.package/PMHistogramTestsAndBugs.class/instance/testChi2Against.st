tests
testChi2Against

self assert: ((h chi2Against: (PMScaledProbabilityDensityFunction histogram: h against:  PMNormalDistribution new))
			closeTo:  2.937623). 