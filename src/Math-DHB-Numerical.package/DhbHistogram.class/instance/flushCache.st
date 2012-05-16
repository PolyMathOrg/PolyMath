transformation
flushCache
	"Private - 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 15/2/99"

	| maximum values |
	minimum isNil ifTrue: [minimum := contents isEmpty
					ifTrue: [0]
					ifFalse: [contents first]].
	maximum := minimum.
	contents do: [:each | each < minimum
			ifTrue: [minimum := each]
			ifFalse: [each > maximum ifTrue: [maximum := each]]].
	maximum = minimum ifTrue: [maximum := minimum + desiredNumberOfBins].
	values := contents.
	self adjustDimensionUpTo: maximum.
	values do: [:each | self accumulate: each]