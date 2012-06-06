initialize-release
initialize
	super initialize.
	hasNextGaussian := false.
	self mean: 0.
	self standardDeviation: 1.
	^ self