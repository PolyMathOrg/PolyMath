information
skewness
		"Answer the variance of the receiver."
	| x |
	x := normalDistribution variance exp.
	^(x - 1) sqrt * (x + 2)