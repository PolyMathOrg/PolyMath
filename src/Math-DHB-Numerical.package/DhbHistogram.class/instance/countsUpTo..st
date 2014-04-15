information
countsUpTo: aNumber
		"Computes the events located up to aNumber.
		 NOTE: This method assumes aNumber is within the limits
					 of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	| n answer |
	self isCached 				
		ifTrue: [ self flushCache].
	n := self binIndex: aNumber.
	n > contents size
		ifTrue: [ ^self count].
	answer := ( contents at: n) * ( aNumber - ( binWidth * ( n - 1) + minimum)) / binWidth.
	1 to: ( n - 1) do: [ :m | answer := answer + ( contents at: m)].
	^answer + underflow