initialization
initialize: aNumber
		"Private - Defines the parameter alpha of the receiver
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "
	alpha := aNumber asFloat.
	alphaLogGamma := alpha logGamma.
	^self