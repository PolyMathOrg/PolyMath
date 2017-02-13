operation
mixupGeneration
	| doMixUp r r1 |
	r := bestPoints first value.
	r1 := (bestPoints at: bestPoints size - 1) value.
	doMixUp := r = 0
		ifTrue: [ r1 = 0
				ifTrue: [ true ]
				ifFalse: [( r1 - r) <  1e-20 ] ]
		ifFalse: [ ((r1 - r) / r) abs < 0.00001 ].
	doMixUp
		ifTrue: [bestPoints := bestPoints copyFrom: 1 to: (bestPoints size // 2 max: 1).
				chromosomeManager randomizePopulation.
				self collectPoints ]