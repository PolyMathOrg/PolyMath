transformation
swapRow: anInteger1 withRow: anInteger2
		"Private - Swap the rows indexed by the given integers.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	| swappedRow |
	anInteger1 = anInteger2
		ifFalse:[ swappedRow := rows at: anInteger1.
					  rows at: anInteger1 put: ( rows at: anInteger2).
					  rows at: anInteger2 put: swappedRow.
					].