creation
histogram: aHistogram distributionClass: aProbabilityDensityFunctionClass 
	"Create a new instance of the receiver with given probability density function and histogram. 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 3/3/99"

	| dp |
	^(dp := aProbabilityDensityFunctionClass fromHistogram: aHistogram) isNil
		ifTrue: [nil]
		ifFalse: [self histogram: aHistogram against: dp]