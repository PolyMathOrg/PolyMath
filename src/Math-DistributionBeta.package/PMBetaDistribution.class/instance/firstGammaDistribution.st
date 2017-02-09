information
firstGammaDistribution

	gamma1 isNil
		ifTrue: [ gamma1 := PMGammaDistribution shape: alpha1 scale: 1].
	 ^gamma1