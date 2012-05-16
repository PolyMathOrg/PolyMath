iterative algorithms
testBissection
	"Code Example 5.1"
	| zeroFinder result |
	zeroFinder := DhbBisectionZeroFinder function: [ :x | x errorFunction - 0.9].
	zeroFinder setPositiveX: 10.0; setNegativeX: 0.0.
	result := zeroFinder evaluate.
	self should: [ zeroFinder hasConverged].
	self should: [ (result -1.28155193291605) abs < 1.0e-14]