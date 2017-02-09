iterators
pointsAndErrorsDo: aBlock

	| x |
	x := self minimum - (binWidth / 2).
	contents
		do: [ :each | 
			x := x + binWidth.
			aBlock value: (PMWeightedPoint point: x count: each) ]