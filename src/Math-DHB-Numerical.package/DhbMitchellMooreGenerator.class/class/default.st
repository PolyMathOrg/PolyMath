creation
default
	"Private- 
	 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/11/00 "

	| congruentialGenerator |
	congruentialGenerator := DhbCongruentialRandomNumberGenerator new.
	^self generateSeeds: congruentialGenerator