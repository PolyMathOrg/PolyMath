creation
fromHistogram: aHistogram
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 3/3/99 "
	| mu |
	aHistogram minimum < 0
		ifTrue: [ ^nil].
	mu := aHistogram average.
	^mu > 0 ifTrue: [ self scale: aHistogram average]
			ifFalse:[ nil]