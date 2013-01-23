statistics
testHistogram
	| histogram |
	histogram := DhbHistogram new.
	histogram setRangeFrom: 0.0 to: 48.0 bins: 8.
	#( 36 13 27 16 33 24 4 20 15 23 37 23 31 15 47 22  6 15 41 22  14 14  31 42 3 42 22 8  37 41 )
		do: [ :x | histogram accumulate: x].
	histogram accumulate: -1; accumulate: 55; accumulate: 56.
	self should: [ histogram count = 30].
	self should: [ histogram underflow = 1].
	self should: [ histogram overflow = 2].
	self should: [ ( histogram countAt: 1) = 3].
	self should: [ ( histogram countAt: 8.5) = 4].
	self should: [ ( histogram countAt: 16) = 8].
	self should: [ ( histogram countAt: 23.5) = 4].
	self should: [ ( histogram countAt: 31) = 6].
	self should: [ ( histogram countAt: 38.5) = 4].
	self should: [ ( histogram countAt: 46) = 1].
	self should: [ (histogram average - 24.1333333333) abs < 0.000000001].
	self should: [ (histogram standardDeviation - 12.461619237603) abs < 0.000000001].
	self should: [ (histogram skewness - 0.116659884676) abs < 0.000000001].
	self should: [ (histogram kurtosis + 1.004665562311) abs < 0.000000001].