operation
computePrecision
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/16/00 "
	| functionValues bestFunctionValue |
	functionValues := bestPoints collect: [ :each | each value].
	bestFunctionValue := functionValues removeFirst.
	^functionValues inject: 0
					into: [ :max :each | ( self precisionOf: ( each - bestFunctionValue) abs relativeTo: bestFunctionValue abs) max: max]