creation
histogram: aHistogram distributionClass: aProbabilityDensityFunctionClass 
	^self points: aHistogram
		function: (PMScaledProbabilityDensityFunction histogram: aHistogram
				distributionClass: aProbabilityDensityFunctionClass)