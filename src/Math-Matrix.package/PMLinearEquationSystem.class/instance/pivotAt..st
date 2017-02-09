transformation
pivotAt: anInteger
	"Private - Performs pivot operation with pivot element at anInteger."
	| inversePivot rowPivotValue row pivotRow |
	pivotRow := rows at: anInteger.
	inversePivot := 1 / (pivotRow at: anInteger).
	(anInteger + 1) to: rows size do:
		[ :n |
		  row := rows at: n.
		  rowPivotValue := (row at: anInteger) * inversePivot.
		  anInteger to: row size do:
			[ :m |
			  row at: m put: ((row at: m) - ((pivotRow at: m) * rowPivotValue)).
			].
		].