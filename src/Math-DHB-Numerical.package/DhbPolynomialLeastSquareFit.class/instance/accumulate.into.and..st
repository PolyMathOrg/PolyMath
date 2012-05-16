transformation
accumulate: aWeightedPoint into: aVectorOfVectors and: aVector
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 18/3/99 "
	| t p powers |
	p := 1.0.
	powers := aVector collect: [ :each | t := p. p := p * aWeightedPoint xValue. t].
	aVector accumulate: powers * ( aWeightedPoint yValue * aWeightedPoint weight).
	1 to: aVector size do:
		[ :k |
		  ( aVectorOfVectors at: k) accumulate: powers * ( ( powers at: k) * aWeightedPoint weight).
		].