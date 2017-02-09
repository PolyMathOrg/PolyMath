creation
seed: anInteger

	| congruentialGenerator |
	congruentialGenerator := PMCongruentialRandomNumberGenerator seed: anInteger.
	^self generateSeeds: congruentialGenerator