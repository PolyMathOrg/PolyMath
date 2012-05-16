information
gamma: aNumber
		"
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/3/99 "
	^( self leadingFactor: aNumber) exp * ( self series: aNumber) * sqrt2Pi / aNumber