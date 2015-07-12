testing
fConfidenceLevel: aStatisticalMomentsOrHistogram 
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/22/00 "
	| fValue |
	fValue := self variance/ aStatisticalMomentsOrHistogram variance.
	^fValue < 1
		ifTrue: [ (DhbFisherSnedecorDistribution degreeOfFreedom: aStatisticalMomentsOrHistogram count
						degreeOfFreedom: self count) 
										confidenceLevel: fValue reciprocal]
		ifFalse:[ (DhbFisherSnedecorDistribution degreeOfFreedom: self count
						degreeOfFreedom: aStatisticalMomentsOrHistogram count) 
										confidenceLevel: fValue]