information
countAt: aNumber
		"Answer the count in the bin corresponding to aNumber or 0 if outside the limits.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	| n |
	n := self binIndex: aNumber.
	^( n between: 1 and: contents size)
			ifTrue: [ contents at: n]
			ifFalse:[ 0]