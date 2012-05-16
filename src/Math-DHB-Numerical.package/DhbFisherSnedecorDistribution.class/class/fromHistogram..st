creation
fromHistogram: aHistogram 
	"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/3/99 "

	| n1 n2 a |
	aHistogram minimum < 0 ifTrue: [^nil].
	n2 := (2 / (1 - (1 / aHistogram average))) rounded.
	n2 > 0 ifFalse: [^nil].
	a := (n2 - 2) * (n2 - 4) * aHistogram variance / (n2 squared * 2).
	n1 := (0.7 * (n2 - 2) / (1 - a)) rounded.
	^n1 > 0 
		ifTrue: [self degreeOfFreedom: n1 degreeOfFreedom: n2]
		ifFalse: [nil]