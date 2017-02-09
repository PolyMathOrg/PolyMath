information
fourthCentralMoment
		"Private"
	| y x |
	y := normalDistribution average exp.
	x := normalDistribution variance exp.
	^( y squared squared) * ( x squared)
		* ( ( ( x squared * x - 4) * ( x squared) + 6) * x - 3)