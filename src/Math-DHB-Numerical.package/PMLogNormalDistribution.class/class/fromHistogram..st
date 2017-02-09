creation
fromHistogram: aHistogram
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit."
	| average variance sigma2 |
	aHistogram minimum < 0
		ifTrue: [ ^nil].
	average := aHistogram average.
	average > 0
		ifFalse: [ ^nil].
	variance := aHistogram variance.
	sigma2 := ( variance / average squared + 1) ln.
	sigma2 > 0
		ifFalse: [ ^nil].
	^self new: ( average ln - (sigma2 * 0.5)) sigma: sigma2 sqrt