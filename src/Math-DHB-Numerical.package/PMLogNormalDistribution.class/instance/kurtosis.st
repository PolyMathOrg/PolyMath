information
kurtosis
		"Answer the variance of the receiver."
	| x |
	x := normalDistribution variance exp.
	^( ( x + 2) * x + 3) * ( x squared) - 6