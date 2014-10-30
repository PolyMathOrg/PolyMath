operation
collectPoints
	"Private - 
	(c) Copyrights Didier BESSET, 2000, all rights reserved. 
	Initial code: 23-Feb-00"

	| bestPoint |
	bestPoints isEmpty ifFalse: [bestPoint := bestPoints first].
	bestPoints removeAll.
	chromosomeManager population do: [:each | self addPointAt: each].
	bestPoint ifNotNil: [:b|bestPoints add: b].
	result := bestPoints first position