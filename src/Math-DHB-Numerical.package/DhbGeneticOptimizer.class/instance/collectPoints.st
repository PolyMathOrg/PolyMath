operation
collectPoints
	"Private"

	| bestPoint |
	bestPoints isEmpty ifFalse: [bestPoint := bestPoints first].
	bestPoints removeAll.
	chromosomeManager population do: [:each | self addPointAt: each].
	bestPoint ifNotNil: [:b|bestPoints add: b].
	result := bestPoints first position