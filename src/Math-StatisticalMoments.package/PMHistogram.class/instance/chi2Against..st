information
chi2Against: aScaledDistribution

	| chi2 |
	chi2 := 0.
	self pointsAndErrorsDo: [ :each | chi2 := (each chi2Contribution: aScaledDistribution) + chi2 ].
	^ chi2