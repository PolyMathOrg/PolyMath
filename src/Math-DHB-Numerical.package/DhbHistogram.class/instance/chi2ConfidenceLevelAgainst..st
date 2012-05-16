information
chi2ConfidenceLevelAgainst: aScaledDistribution
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/30/00 "
	^( DhbChiSquareDistribution degreeOfFreedom: ( contents size - aScaledDistribution parameters size))
			confidenceLevel: ( self chi2Against: aScaledDistribution)