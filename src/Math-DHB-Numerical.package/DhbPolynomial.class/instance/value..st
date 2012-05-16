information
value: aNumber
		"Answer the value of the polynomial for the specified variable value.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/1/99 "
	^coefficients inject: 0 into: [ :sum :each | sum * aNumber + each]