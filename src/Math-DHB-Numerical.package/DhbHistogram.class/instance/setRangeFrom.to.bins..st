initialization
setRangeFrom: aNumber1 to: aNumber2 bins: anInteger
		"Defines the range of the receiver by specifying the minimum, maximum and number of bins.
		 Values are adjusted to correspond to a reasonable value for the bin width and the limits.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	self isCached
		ifFalse: [ self error: 'Histogram limits cannot be redefined'].
	minimum := aNumber1.
	self setDesiredNumberOfBins: anInteger;
		   adjustDimensionUpTo: aNumber2.