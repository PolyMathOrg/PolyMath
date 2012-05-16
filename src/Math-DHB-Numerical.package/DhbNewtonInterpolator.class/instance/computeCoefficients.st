information
computeCoefficients
		"Private - Computes the coefficients for the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| size k1 kn|
	size := pointCollection size.
	coefficients := ( 1 to: size) collect: [ :n | self yPointAt: n].
	1 to: (size - 1)
		do: [ :n |
			  size to: ( n + 1)  by: -1
				do: [ :k |
					  k1 := k - 1.
					  kn := k - n.
					  coefficients at: k put: ( (( coefficients at: k) - ( coefficients at: k1)) 
											/ ((self xPointAt: k) - (self xPointAt: kn))).
					].
			].