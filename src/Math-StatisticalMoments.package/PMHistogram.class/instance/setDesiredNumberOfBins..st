initialization
setDesiredNumberOfBins: anInteger
	"Defines the desired number of bins. It may be adjusted to a few units later on. "

	anInteger > 0
		ifFalse: [ self error: 'Desired number of bins must be positive' ].
	desiredNumberOfBins := anInteger