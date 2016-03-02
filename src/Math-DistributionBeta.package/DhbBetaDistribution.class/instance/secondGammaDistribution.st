information
secondGammaDistribution
	
	gamma2 isNil
		ifTrue: [ gamma2 := DhbGammaDistribution shape: alpha2 scale: 1].
	 ^gamma2