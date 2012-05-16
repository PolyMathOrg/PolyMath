information
integralFrom: aNumber1 to: aNumber2
		"Private - Compute the integral of the receiver from aNumber1 to aNumber2.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 14/4/99 "
	^( DhbRombergIntegrator new: self from: aNumber1 to: aNumber2) evaluate