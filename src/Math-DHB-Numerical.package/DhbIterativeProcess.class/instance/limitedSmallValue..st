information
limitedSmallValue: aNumber
		"Private - prevent aNumber from being smaller in absolute value than a small number.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/3/99 "
	^aNumber abs < DhbFloatingPointMachine new smallNumber
			ifTrue: [ DhbFloatingPointMachine new smallNumber]
			ifFalse:[ aNumber]