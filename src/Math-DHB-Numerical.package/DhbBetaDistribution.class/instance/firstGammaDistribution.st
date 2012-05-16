information
firstGammaDistribution
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	gamma1 isNil
		ifTrue: [ gamma1 := DhbGammaDistribution shape: alpha1 scale: 1].
	 ^gamma1