operation
findPositiveXFrom: aNumber1 range: aNumber2
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 22/4/99 "
	| n |
	n := 0.
	[ positiveX := Number random * aNumber2 + aNumber1.
	  ( functionBlock value: positiveX) > 0
		] whileFalse: [ n := n + 1.
						n > maximumIterations
							ifTrue: [ self error: 'Unable to find a positive function value'].
					  ].