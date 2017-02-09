creation
fromHistogram: aHistogram
	"Create an instance of the receiver with parameters estimated from the given histogram using best guesses. This method can be used to find the initial values for a fit."

	^ self
		new: aHistogram average
		sigma: aHistogram standardDeviation