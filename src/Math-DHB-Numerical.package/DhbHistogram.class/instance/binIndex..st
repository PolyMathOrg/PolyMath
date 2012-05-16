information
binIndex: aNumber
		"Answers the index of the bin corresponding to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	^( ( aNumber - minimum) / binWidth) floor + 1