private
pivotAt: anInteger
	"Private"
	| inversePivot size k |
	inversePivot := 1 / ((rows at: anInteger) at: anInteger).
	size := rows size.
	k := anInteger + 1.
	k to: size
		do: [ :i |
			  (rows at: i) at: anInteger put: ((rows at: i) at: anInteger) * inversePivot.
			  k to: size
				do: [ :j |
					  (rows at: i) at: j put: ((rows at: i) at: j) - (((rows at: i) at: anInteger) * ((rows at: anInteger) at: j)).
					]
			].