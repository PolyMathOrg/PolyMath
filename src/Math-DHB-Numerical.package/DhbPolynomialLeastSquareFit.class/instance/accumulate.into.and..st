transformation
accumulate: aWeightedPoint into: aVectorOfVectors and: aVector
		"Private"
	| t p powers |
	p := 1.0.
	powers := aVector collect: [ :each | t := p. p := p * aWeightedPoint xValue. t].
	aVector accumulate: powers * ( aWeightedPoint yValue * aWeightedPoint weight).
	1 to: aVector size do:
		[ :k |
		  ( aVectorOfVectors at: k) accumulate: powers * ( ( powers at: k) * aWeightedPoint weight).
		]