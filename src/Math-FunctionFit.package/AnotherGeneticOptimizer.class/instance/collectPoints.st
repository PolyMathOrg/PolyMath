operation
collectPoints
	| size |
	size := steadyState
		ifTrue: [ chromosomeManager populationSize ]
		ifFalse: [ 1 ].
	bestPoints size > size
		ifTrue: [ bestPoints := bestPoints copyFrom: 1 to: size ].
	chromosomeManager population do: [ :each | self addPointAt: each ].
	result := bestPoints first position