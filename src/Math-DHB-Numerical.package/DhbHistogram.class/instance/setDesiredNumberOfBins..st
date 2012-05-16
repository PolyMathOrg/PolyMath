initialization
setDesiredNumberOfBins: anInteger
		"Defines the desired number of bins. It may be adjusted to a few units later on.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	anInteger > 0
		ifFalse:[ self error: 'Desired number of bins must be positive'].
	desiredNumberOfBins := anInteger.