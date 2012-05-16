creation
join: anArrayOfMatrices
		"Inverse of the split operation.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/5/99 "
	| rows n row rowSize n1 n2 |
	rows := OrderedCollection new.
	n1 := ( anArrayOfMatrices at: 1) numberOfColumns.
	n2 := n1 + 1.
	rowSize := n1 + ( anArrayOfMatrices at: 2) numberOfColumns.
	n := 0.
	( anArrayOfMatrices at: 1) rowsDo:
		[ :each |
		  n := n + 1.
		  row := DhbVector new: rowSize.
		  row replaceFrom: 1 to: n1 with: each startingAt: 1;
			  replaceFrom: n2 to: rowSize with: ( ( anArrayOfMatrices at: 2) rowAt: n) startingAt: 1.
		  rows add: row.
		].
	n := 0.
	( anArrayOfMatrices at: 3) rowsDo:
		[ :each |
		  n := n + 1.
		  row := DhbVector new: rowSize.
		  row replaceFrom: 1 to: n1 with: each startingAt: 1;
			  replaceFrom: n2 to: rowSize with: ( ( anArrayOfMatrices at: 4) rowAt: n) startingAt: 1.
		  rows add: row.
		].
	^self rows: rows