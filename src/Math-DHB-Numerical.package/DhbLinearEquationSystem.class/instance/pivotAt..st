transformation
pivotAt: anInteger
		"Private - Performs pivot operation with pivot element at anInteger.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	| inversePivot rowPivotValue row pivotRow |
	pivotRow := rows at: anInteger.
	inversePivot := 1 / ( pivotRow at: anInteger).
	( anInteger + 1) to: rows size do:
		[ :n |
		  row := rows at: n.
		  rowPivotValue := ( row at: anInteger) * inversePivot.
		  anInteger to: row size do:
			[ :m |
			  row at: m put: ( ( row at: m) - (( pivotRow at: m) * rowPivotValue)).
			].
		].