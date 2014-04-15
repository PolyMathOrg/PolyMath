double dispatching
subtractWithRegularMatrix: aMatrix
		"Answers the difference between aMatrix and the receiver as aDhbMatrix.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| n |
	n := 0.
	^DhbMatrix rows: ( aMatrix rowsCollect: [ :each | n := n + 1. each - ( self rowAt: n)])