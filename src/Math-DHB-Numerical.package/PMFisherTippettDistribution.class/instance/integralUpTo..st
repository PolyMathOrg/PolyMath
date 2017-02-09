information
integralUpTo: aNumber
		"Private - Compute the integral of the receiver from -infinity to aNumber.
		 aNumber must be below 0 (no checking!)."
	^( PMRombergIntegrator function:
			[ :x | x = 0 ifTrue: [ 0] ifFalse: [ ( self value: 1 / x) / x squared] ]
			from: 1 / aNumber to: 0) evaluate