operation
evaluateIteration
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "
	| randomScale |
	randomScale := self randomScale.
	chromosomeManager reset.
	[ chromosomeManager isFullyPopulated]
		whileFalse: [ self processRandomParents: randomScale].
	self collectPoints.
	^self computePrecision