initialization
initialize: aPoint error: aNumber
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/5/00 "
	error := aNumber.
	^self initialize: aPoint weight: 1 / aNumber squared