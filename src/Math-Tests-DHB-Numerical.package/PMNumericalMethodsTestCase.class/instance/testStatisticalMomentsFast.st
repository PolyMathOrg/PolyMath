statistics
testStatisticalMomentsFast
	| accumulator |
	accumulator := PMFastStatisticalMoments new.
	#(36 13 27 16 33 24 4 20 15 23 37 23 31 15 47 22 6 15 41 22 14 14 31 42 3 42 22 8 37 41)
		do: [ :x | accumulator accumulate: x ].
	self assert: (accumulator average - 24.1333333333) abs < 0.000000001.
	self
		assert: (accumulator standardDeviation - 12.461619237603) abs < 0.000000001.
	self
		assert: (accumulator skewness - 0.116659884676) abs < 0.000000001.
	self
		assert: (accumulator kurtosis + 1.004665562311) abs < 0.000000001