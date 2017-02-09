operation
evaluateIteration
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/6/99 "
	| indices |
	indices := self largestOffDiagonalIndices.
	self transformAt: ( indices at: 1) and: ( indices at: 2).
	^precision