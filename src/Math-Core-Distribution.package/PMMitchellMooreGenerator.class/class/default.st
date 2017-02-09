creation
default

	| congruentialGenerator |
	congruentialGenerator := PMCongruentialRandomNumberGenerator new.
	^self generateSeeds: congruentialGenerator