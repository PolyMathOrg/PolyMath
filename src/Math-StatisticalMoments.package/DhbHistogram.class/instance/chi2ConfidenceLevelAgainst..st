information
chi2ConfidenceLevelAgainst: aScaledDistribution

	^ (DhbChiSquareDistribution degreeOfFreedom: contents size - aScaledDistribution parameters size)
		confidenceLevel: (self chi2Against: aScaledDistribution)