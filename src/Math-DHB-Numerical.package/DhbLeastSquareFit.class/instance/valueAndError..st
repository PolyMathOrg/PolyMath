information
valueAndError: aNumber
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/8/00 "
	| valueGradient |
	valueGradient := result valueAndGradient: aNumber.
	^Array with: valueGradient first
		   with: ( valueGradient last * ( self errorMatrix * valueGradient last)) sqrt