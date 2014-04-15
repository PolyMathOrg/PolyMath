double dispatching
addWithRegularMatrix: aMatrix
		"Answers the sum of the receiver with aMatrix as a DhbMatrix.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| n |
	n := 0.
	^DhbMatrix rows: ( self rowsCollect: [ :each | n := n + 1. each + ( aMatrix rowAt: n)])