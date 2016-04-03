information
integralFrom: aNumber1 to: aNumber2
		"Private - Compute the integral of the receiver from aNumber1 to aNumber2."
	^( DhbRombergIntegrator function: [:x|self value:x] from: aNumber1 to: aNumber2) evaluate