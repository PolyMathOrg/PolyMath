creation
histogram: aHistogram distributionClass: aProbabilityDensityFunctionClass 
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/3/99 "

	^self points: aHistogram
		function: (DhbScaledProbabilityDensityFunction histogram: aHistogram
				distributionClass: aProbabilityDensityFunctionClass)