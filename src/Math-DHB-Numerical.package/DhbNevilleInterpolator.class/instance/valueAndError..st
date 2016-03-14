information
valueAndError: aNumber
		"Compute and return the interpolated value of the interpolation Lagranage polynomial
		 and its estimated error.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 7/4/99 "
	| size nearestIndex answer error |
	nearestIndex := self initializeDifferences: aNumber.
	nearestIndex < 0
		ifTrue: [ ^Array with: ( self yPointAt: nearestIndex negated) with: 0].
	answer := leftErrors at: nearestIndex.
	nearestIndex := nearestIndex - 1.
	size := pointCollection size.
	1 to: ( size - 1) do:
		[ :m |
		  1 to: ( size - m) do:
			[ :n | self computeDifference: aNumber at: n order: m].
		  size - m > ( 2 * nearestIndex)
				ifTrue: [ error := leftErrors at: ( nearestIndex + 1) ]
				ifFalse:[ error := rightErrors at: ( nearestIndex).
							  nearestIndex := nearestIndex - 1.
							].
		  answer := answer + error.
		].
	^Array with: answer with: error abs