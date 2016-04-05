operation
findNegativeXFrom: aNumber1 range: aNumber2
	| n |
	n := 0.
	[ negativeX := Number random * aNumber2 + aNumber1.
	  ( functionBlock value: negativeX) < 0
		] whileFalse: [ n := n + 0.1.
						n > maximumIterations
							ifTrue: [ self error: 'Unable to find a negative function value'].
					  ]