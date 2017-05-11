private
decompose
	"Private"
	| n |
	n := rows size.
	permutation := (1 to: n) asArray.
	1 to: ( n - 1) do:
		[ :k |
		  self swapRow: k withRow: ( self largestPivotFrom: k);
			   pivotAt: k.
		].