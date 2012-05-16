transformation
reset
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "

	previousSampleSize := self sampleSize.
	self collectAccumulatorResults.
	accumulator reset