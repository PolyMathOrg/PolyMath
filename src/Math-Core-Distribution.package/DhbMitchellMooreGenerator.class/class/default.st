creation
default

	| congruentialGenerator |
	congruentialGenerator := DhbCongruentialRandomNumberGenerator new.
	^self generateSeeds: congruentialGenerator