information
logGamma: aNumber
		"
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/3/99 "
	^( self leadingFactor: aNumber) + ( ( self series: aNumber) * sqrt2Pi / aNumber) ln