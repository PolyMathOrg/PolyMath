operation
accumulate: aWeightedPoint
		"Private"
	| f g |
	f := result valueAndGradient: aWeightedPoint xValue.
	g := f last.
	f := f first.
	constants accumulate: g * ( ( aWeightedPoint yValue - f) * aWeightedPoint weight).
	1 to: g size do:
		[ :k |
		  ( equations at: k) accumulate: g * ( ( g at: k) * aWeightedPoint weight).
		]