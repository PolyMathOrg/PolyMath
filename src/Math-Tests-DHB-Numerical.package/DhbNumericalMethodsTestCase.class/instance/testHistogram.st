statistics
testHistogram
	| histogram |
	histogram := DhbHistogram new.
	histogram setRangeFrom: 0.0 to: 48.0 bins: 8.
	#(36 13 27 16 33 24 4 20 15 23 37 23 31 15 47 22 6 15 41 22 14 14 31 42 3 42 22 8 37 41)
		do: [ :x | histogram accumulate: x ].
	histogram
		accumulate: -1;
		accumulate: 55;
		accumulate: 56.
	self assert: histogram count equals: 30.
	self assert: histogram underflow equals: 1.
	self assert: histogram overflow equals: 2.
	self assert: (histogram countAt: 1) equals: 3.
	self assert: (histogram countAt: 8.5) equals: 4.
	self assert: (histogram countAt: 16) equals: 8.
	self assert: (histogram countAt: 23.5) equals: 4.
	self assert: (histogram countAt: 31) equals: 6.
	self assert: (histogram countAt: 38.5) equals: 4.
	self assert: (histogram countAt: 46) equals: 1.
	self assert: (histogram average - 24.1333333333) abs < 0.000000001.
	self
		assert: (histogram standardDeviation - 12.461619237603) abs < 0.000000001.
	self assert: (histogram skewness - 0.116659884676) abs < 0.000000001.
	self assert: (histogram kurtosis + 1.004665562311) abs < 0.000000001