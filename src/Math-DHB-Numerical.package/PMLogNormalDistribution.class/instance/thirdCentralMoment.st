information
thirdCentralMoment
		"Private"
	| y x |
	y := normalDistribution average exp.
	x := normalDistribution variance exp.
	^( y squared * y) * ( x raisedTo: (3/2))
		* ( ( x squared negated + 3) * x - 2)