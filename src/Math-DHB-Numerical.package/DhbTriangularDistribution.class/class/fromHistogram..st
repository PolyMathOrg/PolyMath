creation
fromHistogram: aHistogram
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit.
		 Default returns nil (must be implemented by subclass).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	| b c|
	b := aHistogram standardDeviation * 1.73205080756888 "12 sqrt / 2".
	b = 0
		ifTrue: [ ^nil].
	c := aHistogram average.
	^self new: c from: ( c - b) to: ( c + b).