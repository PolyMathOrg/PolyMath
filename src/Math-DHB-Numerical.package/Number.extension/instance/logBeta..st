*Math-DHB-Numerical-Extensions
logBeta: aNumber
		"Computes the logarithm of the beta function of the receiver and aNumber
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/3/99 "
	^self logGamma + aNumber logGamma - ( self + aNumber) logGamma