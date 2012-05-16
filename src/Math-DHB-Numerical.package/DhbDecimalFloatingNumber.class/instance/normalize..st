transformation
normalize: aNumber
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 9/6/99 "
	exponent := (self class digits - (aNumber log: 10)) floor.
	mantissa := ( aNumber * ( 10 raisedToInteger: exponent)) truncated.
	^self