initialization
initialize: aNumber1 shape: aNumber2 

	alpha1 := aNumber1.
	alpha2 := aNumber2.
	logNorm := ( alpha1 + alpha2) logGamma - alpha1 logGamma - alpha2 logGamma.
	^self