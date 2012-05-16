information
confidenceLevel: aNumber
		"Answer the probability in percent of finding a chi square value
		 distributed according to the receiver larger than aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "
	^( 1 - ( self distributionValue: aNumber)) *100