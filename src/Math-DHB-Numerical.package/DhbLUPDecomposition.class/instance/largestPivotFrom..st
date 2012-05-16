information
largestPivotFrom: anInteger
		"Private - Answers the largest pivot element in column anInteger, from position anInteger upward.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	| valueOfMaximum indexOfMaximum value |
	valueOfMaximum := ( ( rows at: anInteger) at: anInteger) abs.
	indexOfMaximum := anInteger.
	( anInteger + 1) to: rows size do:
		[ :n |
		  value := ( ( rows at: n) at: anInteger) abs.
		  value > valueOfMaximum
				ifTrue: [ valueOfMaximum := value.
						  indexOfMaximum := n.
						].
		].
	^indexOfMaximum