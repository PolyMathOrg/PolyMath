information
secondGammaDistribution
	
	gamma2 isNil
		ifTrue: [ gamma2 := PMGammaDistribution shape: alpha2 scale: 1].
	 ^gamma2