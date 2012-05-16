creation
seed: anInteger
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/18/00 "

	| congruentialGenerator |
	congruentialGenerator := DhbCongruentialRandomNumberGenerator seed: anInteger.
	^self generateSeeds: congruentialGenerator