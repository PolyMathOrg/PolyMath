creation
fromHistogram: aHistogram 
	"Create an instance of the receiver with parameters estimated from the 
	given histogram using best guesses. This method can be used to 
	find the initial values for a fit. 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 12/3/99"

	| average variance a b |
	(aHistogram minimum < 0 or: [aHistogram maximum > 1])
		ifTrue: [^nil].
	average := aHistogram average.
	variance := aHistogram variance.
	a := 1 - average / variance - 1 * average.
	a > 0 ifFalse: [^nil].
	b := 1 / average - 1 * a.
	b > 0 ifFalse: [^nil].
	^self shape: a shape: b