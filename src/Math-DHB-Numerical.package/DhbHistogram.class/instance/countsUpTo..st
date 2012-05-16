information
countsUpTo: aNumber
		"Computes the events located up to aNumber.
		 NOTE: This method assumes aNumber is within the limits
					 of the receiver and that the receiver is not cached.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	| n answer |
	n := self binIndex: aNumber.
	n > contents size
		ifTrue: [ ^self count].
	answer := ( contents at: n) * ( aNumber - ( binWidth * ( n - 1) + self minimum)) / binWidth.
	1 to: ( n - 1) do: [ :m | answer := answer + ( contents at: m)].
	^answer + underflow