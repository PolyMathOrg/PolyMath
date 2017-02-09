information
binIndex: aNumber
	"Answers the index of the bin corresponding to aNumber."
	
	^ ((aNumber - minimum) / binWidth) floor + 1