creation
fromHistogram: aHistogram 
	"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 3/3/99 "

	| beta |
	beta := aHistogram standardDeviation.
	beta = 0 ifTrue: [^nil].
	beta := beta * (6 sqrt / Float pi).
	^self shape: aHistogram average - (0.5772156649 * beta) scale: beta