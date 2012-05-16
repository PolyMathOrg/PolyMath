information
largestPivotFrom: anInteger
		"Private - Answers the largest pivot element in column anInteger, from position anInteger upward.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	| valueOfMaximum indexOfMaximum |
	valueOfMaximum := ( rows at: anInteger) at: anInteger.
	indexOfMaximum := anInteger.
	( anInteger + 2) to: rows size do:
		[ :n |
		  ( ( rows at: n) at: anInteger) > valueOfMaximum
				ifTrue: [ valueOfMaximum := ( rows at: n) at: anInteger.
							 indexOfMaximum := n.
						   ].
		].
	^indexOfMaximum