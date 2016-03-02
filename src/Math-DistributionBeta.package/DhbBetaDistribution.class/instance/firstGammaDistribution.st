information
firstGammaDistribution

	gamma1 isNil
		ifTrue: [ gamma1 := DhbGammaDistribution shape: alpha1 scale: 1].
	 ^gamma1