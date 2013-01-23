estimation
testTTest

	| accC accMM confidenceLevel|
	accC := DhbStatisticalMoments new.
	#( 5.56 5.89 4.66 5.69 5.34 4.79 4.80 7.86 3.64 5.70 )
		do: [ :x | accC accumulate: x].
	accMM := DhbStatisticalMoments new.
	#( 7.48 6.75 3.77 5.71 7.25 4.73 6.23 5.60 5.94 4.58 )
		do: [ :x | accMM accumulate: x].
	confidenceLevel := accC tConfidenceLevel: accMM.
	self should: [ (accC average - 5.393) abs < 0.000000001].
	self should: [ (accC standardDeviation - 1.0990809292) abs < 0.000000001].
	self should: [ (accMM average - 5.804) abs < 0.000000001].
	self should: [ (accMM standardDeviation - 1.19415428) abs < 0.000000001].
	self should: [ (confidenceLevel - 56.6320739989) abs < 0.000000001].