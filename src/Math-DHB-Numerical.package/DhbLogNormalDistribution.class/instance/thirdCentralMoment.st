information
thirdCentralMoment
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 24/6/99 "
	| y x |
	y := normalDistribution average exp.
	x := normalDistribution variance exp.
	^( y squared * y) * ( x raisedTo: (3/2))
		* ( ( x squared negated + 3) * x - 2)