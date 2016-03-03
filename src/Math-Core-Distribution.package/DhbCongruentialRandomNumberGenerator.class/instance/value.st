information
value
	"Answer the next pseudo-random value."
	seed := ( seed * multiplicator + constant) \\ modulus.
	^seed