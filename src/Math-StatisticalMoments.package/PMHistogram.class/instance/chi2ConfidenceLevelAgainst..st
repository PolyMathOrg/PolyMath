information
chi2ConfidenceLevelAgainst: aScaledDistribution

	^ (PMChiSquareDistribution degreeOfFreedom: contents size - aScaledDistribution parameters size)
		confidenceLevel: (self chi2Against: aScaledDistribution)