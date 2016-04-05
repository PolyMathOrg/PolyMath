operation
evaluateIteration
	| randomScale |
	randomScale := self randomScale.
	randomScale at: randomScale size put: 1. "for floating point errors in #randomScale "
	chromosomeManager reset.
	[ chromosomeManager isFullyPopulated]
		whileFalse: [ self processRandomParents: randomScale].
	self collectPoints.
	^self computePrecision