transformation
accumulateNegated: aMatrix
		"Answers the sum of the receiver with aMatrix.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| n |
	n := 0.
	self rowsCollect: [ :each | n := n + 1. each accumulateNegated: ( aMatrix rowAt: n)]