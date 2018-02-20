initialization
initializeYWithRandomValues
	"Answer a new Matrix Y with the number of rows of x and number of columns ndims filled with random numbers following a normal distribution (0,1)"
	"We should add this to PMMatrix API later"

	| a b rows columns d |
	rows := x dimension x.
	columns := ndims.
	d := PMNormalDistribution new:0 sigma: 1.
	a := (1 to: rows)
		collect: [ :row | 
			b := PMVector new: columns.
			1 to: columns do: [ :column | b at: column put: d random ].
			b ].
	y := PMMatrix rows: a