operation
accumulate: aWeightedPoint
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/3/99 "
	| f g |
	f := result valueAndGradient: aWeightedPoint xValue.
	g := f last.
	f := f first.
	constants accumulate: g * ( ( aWeightedPoint yValue - f) * aWeightedPoint weight).
	1 to: g size do:
		[ :k |
		  ( equations at: k) accumulate: g * ( ( g at: k) * aWeightedPoint weight).
		].