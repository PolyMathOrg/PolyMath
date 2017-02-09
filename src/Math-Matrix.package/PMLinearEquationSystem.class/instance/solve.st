transformation
solve
	"Private - Perform LU decomposition of the system."
	1 to: rows size do: [ :n | self pivotStepAt: n ].
	solutions := Array new: ((rows at: 1) size - rows size).