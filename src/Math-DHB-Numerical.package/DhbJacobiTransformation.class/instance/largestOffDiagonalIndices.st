information
largestOffDiagonalIndices
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/6/99 "
	| n m abs |
	n := 2.
	m := 1.
	precision := ( ( lowerRows at: n) at: m) abs.
	1 to: lowerRows size do:
		[ :i |
		  1 to: ( i - 1) do:
			[ :j |
			  abs := ( ( lowerRows at: i) at: j) abs.
			  abs > precision
				ifTrue: [ n := i.
						  m := j.
						  precision := abs.
						]. 
			].
		].
	^Array with: m with: n