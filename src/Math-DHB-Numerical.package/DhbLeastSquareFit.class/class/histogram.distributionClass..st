creation
histogram: aHistogram distributionClass: aProbabilityDensityFunctionClass 
	^self points: aHistogram
		function: (DhbScaledProbabilityDensityFunction histogram: aHistogram
				distributionClass: aProbabilityDensityFunctionClass)