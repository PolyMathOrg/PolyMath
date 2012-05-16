information
variance
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/5/99 "
	| n |
	n := self count.
	n < 2
		ifTrue: [ ^nil].
	^self unnormalizedVariance / ( n - 1)