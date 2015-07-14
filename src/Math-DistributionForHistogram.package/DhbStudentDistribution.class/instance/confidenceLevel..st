information
confidenceLevel: aNumber
		"Answer the probability in percent of finding a value
		 distributed according to the receiver with an absolute value
		 larger than aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/3/99 "
	^( 1 - ( self symmetricAcceptance: aNumber abs)) * 100