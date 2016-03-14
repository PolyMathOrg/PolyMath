initialization
initialize: aNumber1 multiplicator: aNumber2 modulus: aNumber3
		"Private - Initializes the constants needed by the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	constant := aNumber1.
	modulus := aNumber2.
	multiplicator := aNumber3.
	self setSeed: 1.