information
value
		"Answer the next pseudo-random value.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	seed := ( seed * multiplicator + constant) \\ modulus.
	^seed