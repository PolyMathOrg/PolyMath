information
integralUpTo: aNumber
		"Private - Compute the integral of the receiver from -infinity to aNumber.
		 aNumber must be below 0 (no checking!).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 14/4/99 "
	^( DhbRombergIntegrator new:
			[ :x | x = 0 ifTrue: [ 0] ifFalse: [ ( self value: 1 / x) / x squared] ]
			from: 1 / aNumber to: 0) evaluate