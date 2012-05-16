information
kurtosis
		"Answer the variance of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	| x |
	x := normalDistribution variance exp.
	^( ( x + 2) * x + 3) * ( x squared) - 6