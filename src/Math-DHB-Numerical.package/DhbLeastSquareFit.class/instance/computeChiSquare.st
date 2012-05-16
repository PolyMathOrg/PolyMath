information
computeChiSquare
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	chiSquare := 0.
	degreeOfFreedom := self numberOfFreeParameters negated.
	dataHolder pointsAndErrorsDo:
		[ :each |
		  chiSquare := ( each chi2Contribution: result) + chiSquare.
		  degreeOfFreedom := degreeOfFreedom + 1.
		].