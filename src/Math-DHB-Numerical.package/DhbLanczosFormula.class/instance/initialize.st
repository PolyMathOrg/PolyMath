initialization
initialize
		"Private - Initialize the coefficients of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/3/99 "
	sqrt2Pi := ( Float pi * 2) sqrt.
	coefficients := #( 76.18009172947146 -86.50532032941677 24.01409824083091 -1.231739572450155 0.1208650973866179e-2 -0.5395239384953e-5).
	^self