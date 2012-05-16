initialization
initialize: aNumber1 sigma: aNumber2
		"Private - Defines the parameters of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	normalDistribution := DhbNormalDistribution new: aNumber1 sigma: aNumber2.
	^self