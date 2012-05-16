information
chi2Against: aScaledDistribution
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/30/00 "
	| chi2 |
	chi2 := 0.
	self pointsAndErrorsDo:
		[ :each | chi2 := ( each chi2Contribution: aScaledDistribution) + chi2].
	^chi2