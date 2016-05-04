operation
computePrecision
		"Private"
	| functionValues bestFunctionValue |
	functionValues := bestPoints collect: [ :each | each value].
	bestFunctionValue := functionValues removeFirst.
	^functionValues inject: 0
					into: [ :max :each | ( self precisionOf: ( each - bestFunctionValue) abs relativeTo: bestFunctionValue abs) max: max]