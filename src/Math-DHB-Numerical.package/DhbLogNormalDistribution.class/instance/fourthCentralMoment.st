information
fourthCentralMoment
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 24/6/99 "
	| y x |
	y := normalDistribution average exp.
	x := normalDistribution variance exp.
	^( y squared squared) * ( x squared)
		* ( ( ( x squared * x - 4) * ( x squared) + 6) * x - 3)