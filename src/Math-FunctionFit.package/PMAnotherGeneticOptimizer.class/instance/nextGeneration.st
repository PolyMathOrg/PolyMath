operation
nextGeneration
	| randomScale |
	randomScale := rangeScale
		ifTrue: [ self rangeScale ]
		ifFalse: [ self randomScale ].
	randomScale at: randomScale size put: 1.
	chromosomeManager reset.
	[ chromosomeManager isFullyPopulated ] whileFalse: [ self processRandomParents: randomScale ].
	self collectPoints