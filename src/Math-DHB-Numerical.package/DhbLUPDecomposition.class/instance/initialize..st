initialization
initialize: anArrayOfArrays
		"Private - A copy of the original array is made.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 30/3/99 "
	rows := anArrayOfArrays.
	parity := 1.
	^self