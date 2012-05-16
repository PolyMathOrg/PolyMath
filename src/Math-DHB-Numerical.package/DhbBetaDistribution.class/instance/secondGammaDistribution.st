information
secondGammaDistribution
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	gamma2 isNil
		ifTrue: [ gamma2 := DhbGammaDistribution shape: alpha2 scale: 1].
	 ^gamma2