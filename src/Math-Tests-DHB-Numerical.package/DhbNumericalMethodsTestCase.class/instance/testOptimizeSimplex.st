optimization
testOptimizeSimplex
	"Code example 11.5"
	| fBlock simplex educatedGuess result |
	fBlock := [ :x | (x * x) negated exp].
	educatedGuess := #( 0.5 1.0 0.5) asDhbVector.
	simplex := DhbSimplexOptimizer maximizingFunction: fBlock.
	simplex initialValue: educatedGuess.
	simplex desiredPrecision: 1.0e-6.
	result := simplex evaluate.
	self should: [ simplex precision < 1.0e-6].
	self should: [ (result at: 1) abs < 1.0e-6].
	self should: [ (result at: 2) abs < 1.0e-6].
	self should: [ (result at: 3) abs < 1.0e-6].