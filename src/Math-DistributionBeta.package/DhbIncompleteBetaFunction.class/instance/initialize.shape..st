initialization
initialize: aNumber1 shape: aNumber2 
	"Private - Initialize the parameters of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "
	alpha1 := aNumber1.
	alpha2 := aNumber2.
	logNorm := ( alpha1 + alpha2) logGamma - alpha1 logGamma - alpha2 logGamma.
	^self