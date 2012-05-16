operation
findNegativeXFrom: aNumber1 range: aNumber2
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 22/4/99 "
	| n |
	n := 0.
	[ negativeX := Number random * aNumber2 + aNumber1.
	  ( functionBlock value: negativeX) < 0
		] whileFalse: [ n := n + 0.1.
						n > maximumIterations
							ifTrue: [ self error: 'Unable to find a negative function value'].
					  ].