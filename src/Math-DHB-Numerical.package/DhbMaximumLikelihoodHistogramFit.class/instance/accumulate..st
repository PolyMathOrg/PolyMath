operation
accumulate: aWeightedPoint
		"Private - 
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	| f g temp inverseProbability|
	f := result valueAndGradient: aWeightedPoint xValue.
	g := f last copyFrom: 1 to: ( f last size - 1).
	f := f first.
	f = 0 ifTrue: [ ^nil].
	inverseProbability := 1 / f.
	temp := aWeightedPoint yValue * inverseProbability.
	constants accumulate: g * temp.
	temp := temp * inverseProbability.
	1 to: g size do:
		[ :k |
		  ( equations at: k) accumulate: g * ( ( g at: k) * temp).
		].