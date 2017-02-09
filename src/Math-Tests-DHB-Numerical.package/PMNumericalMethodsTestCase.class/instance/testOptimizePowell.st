optimization
testOptimizePowell
	"Code example 11.3"

	| fBlock hillClimber educatedGuess result |
	fBlock := [ :x | (x * x) negated exp ].
	educatedGuess := #(0.5 1.0 0.5) asDhbVector.
	hillClimber := PMHillClimbingOptimizer maximizingFunction: fBlock.
	hillClimber initialValue: educatedGuess.
	hillClimber desiredPrecision: 1.0e-6.
	result := hillClimber evaluate.
	self assert: hillClimber precision < 1.0e-6.
	self assert: (result at: 1) abs < 1.0e-6.
	self assert: (result at: 2) abs < 1.0e-6.
	self assert: (result at: 3) abs < 1.0e-6