private
adjustDimensionUpTo: aNumber
	"Private - Compute an adequate bin width and adjust the minimum and number of bins accordingly.
	aNumber is the maximum value to accumulate. The minimum value has already been assigned. "

	| maximum |
	binWidth := self roundToScale: (aNumber - minimum) / desiredNumberOfBins.
	minimum := (minimum / binWidth) floor * binWidth.
	maximum := (aNumber / binWidth) ceiling * binWidth.
	contents := Array new: ((maximum - minimum) / binWidth) ceiling.
	contents atAllPut: 0