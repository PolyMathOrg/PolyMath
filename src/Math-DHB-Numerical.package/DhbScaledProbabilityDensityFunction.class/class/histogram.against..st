creation
histogram: aHistogram against: aProbabilityDensityFunction 
	"Create a new instance of the receiver with given probability density function and histogram.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 3/3/99 "

	^self new 
		initialize: aProbabilityDensityFunction
		binWidth: aHistogram binWidth
		count: aHistogram totalCount