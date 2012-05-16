transformation
decompose
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 30/3/99 "
	| n |
	n := rows size.
	permutation := (1 to: n) asArray.
	1 to: ( n - 1) do:
		[ :k |
		  self swapRow: k withRow: ( self largestPivotFrom: k);
			   pivotAt: k.
		].