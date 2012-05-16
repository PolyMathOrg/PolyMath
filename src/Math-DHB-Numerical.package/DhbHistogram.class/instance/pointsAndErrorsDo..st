iterators
pointsAndErrorsDo: aBlock
		"
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/3/99 "
	| x |
	x := self minimum - ( self binWidth / 2).
	contents do:
		[ :each |
		  x := x + self binWidth.
		  aBlock value: ( DhbWeightedPoint point: x count: each).
		].