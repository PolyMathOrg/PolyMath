creation
fromHistogram: aHistogram
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 3/3/99 "
	| average xMin xMax accMin accMax |
	aHistogram minimum < 0
		ifTrue: [ ^nil].
	average := aHistogram average.
	xMin := ( aHistogram minimum + average) / 2.
	accMin := ( aHistogram countsUpTo: xMin) / aHistogram totalCount.
	xMax := ( aHistogram maximum + average) / 2.
	accMax := ( aHistogram countsUpTo: xMax) / aHistogram totalCount.
	^[self solve: xMin acc: accMin upper: xMax acc: accMax]
			on: Error do: [ :signal | signal return: nil]