transformation
reset

	previousSampleSize := self sampleSize.
	self collectAccumulatorResults.
	accumulator reset