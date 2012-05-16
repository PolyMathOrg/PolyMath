information
inverseDistributionValue: aNumber
		"Private - Compute the value which corresponds to a integrated count of aNumber.
		 NOTE: aNumber is assumed to be between 0 and 1.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/3/99 "
	| count x integral |
	count := self count * aNumber.
	x := self minimum.
	integral := 0.
	contents do:
		[ :each | | delta |
		  delta := count - integral.
		  each > delta
			ifTrue: [ ^self binWidth * delta / each + x].
		  integral := integral + each.
		  x := self binWidth + x.
		].
	^self maximum