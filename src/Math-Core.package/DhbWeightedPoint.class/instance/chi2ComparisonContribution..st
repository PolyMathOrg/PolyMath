information
chi2ComparisonContribution: aWeightedPoint

	^ (aWeightedPoint yValue - yValue) squared / (1 / aWeightedPoint weight + (1 / weight))