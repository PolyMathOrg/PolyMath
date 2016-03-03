creation
seed: anInteger

	| congruentialGenerator |
	congruentialGenerator := DhbCongruentialRandomNumberGenerator seed: anInteger.
	^self generateSeeds: congruentialGenerator