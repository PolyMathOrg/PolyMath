information
countsBetween: aNumber1 and: aNumber2
		"Computes the events located between aNumber1 and aNumber2.
		 NOTE: This method assumes the two numbers are within the limits
			   of the receiver and that the receiver is not cached.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	| n1 n2 answer |
	n1 := self binIndex: aNumber1.
	n2 := self binIndex: aNumber2.
	answer := ( contents at: n1) * ( ( binWidth * n1 + minimum) - aNumber1) / binWidth.
	n2 > contents size
		ifTrue: [ n2 := contents size + 1]
		ifFalse:[ answer := answer + ( ( contents at: n2) * ( aNumber2 - ( binWidth * ( n2 - 1) + self maximum)) / binWidth)].
	( n1 + 1) to: ( n2 - 1) do: [ :n | answer := answer + ( contents at: n)].
	^answer