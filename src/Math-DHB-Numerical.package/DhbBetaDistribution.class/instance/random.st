information
random
		"Answer a random number distributed accroding to the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	| r |
	r := self firstGammaDistribution random.
	^r / ( self secondGammaDistribution random + r)