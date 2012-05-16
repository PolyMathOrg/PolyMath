initialization
initialize: anInteger
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	accumulator := DhbCovarianceAccumulator new: anInteger.
	^self