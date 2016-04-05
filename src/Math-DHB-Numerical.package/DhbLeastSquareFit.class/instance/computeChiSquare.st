information
computeChiSquare
		"Private"
	chiSquare := 0.
	degreeOfFreedom := self numberOfFreeParameters negated.
	dataHolder pointsAndErrorsDo:
		[ :each |
		  chiSquare := ( each chi2Contribution: result) + chiSquare.
		  degreeOfFreedom := degreeOfFreedom + 1.
		].