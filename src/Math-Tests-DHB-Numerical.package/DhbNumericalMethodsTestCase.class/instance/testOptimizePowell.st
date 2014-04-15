optimization
testOptimizePowell
	"Code example 11.3"
	| fBlock hillClimber educatedGuess result |
	fBlock := [ :x | (x * x) negated exp].
	educatedGuess := #( 0.5 1.0 0.5) asDhbVector.
	hillClimber := DhbHillClimbingOptimizer maximizingFunction: fBlock.
	hillClimber initialValue: educatedGuess.
	hillClimber desiredPrecision: 1.0e-6.
	result := hillClimber evaluate.
	self should: [ hillClimber precision < 1.0e-6].
	self should: [ (result at: 1) abs < 1.0e-6].
	self should: [ (result at: 2) abs < 1.0e-6].
	self should: [ (result at: 3) abs < 1.0e-6].