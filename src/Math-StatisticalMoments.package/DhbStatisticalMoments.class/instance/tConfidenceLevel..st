testing
tConfidenceLevel: aStatisticalMomentsOrHistogram
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/22/00 "
	| sbar dof |
	dof := self count + aStatisticalMomentsOrHistogram count - 2.
	sbar := ( ( self unnormalizedVariance + aStatisticalMomentsOrHistogram unnormalizedVariance) / dof) sqrt.
	^( DhbStudentDistribution degreeOfFreedom: dof)
		confidenceLevel: ( self average - (aStatisticalMomentsOrHistogram average))
							/ ( ( 1 / self count + ( 1 / aStatisticalMomentsOrHistogram count)) sqrt * sbar)