operation
collectPoints
	"Private - 
	(c) Copyrights Didier BESSET, 2000, all rights reserved. 
	Initial code: 23-Feb-00"

	| bestPoint |
	bestPoints isEmpty not ifTrue: [bestPoint := bestPoints removeFirst].
	bestPoints removeAll: bestPoints asArray.
	chromosomeManager population do: [:each | self addPointAt: each].
	bestPoint notNil ifTrue: [bestPoints add: bestPoint].
	result := bestPoints first position