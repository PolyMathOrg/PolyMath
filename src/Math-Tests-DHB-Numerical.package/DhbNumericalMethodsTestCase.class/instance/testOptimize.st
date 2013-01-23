optimization
testOptimize
	"General optimizer to test genetic algorithm"
	| fBlock finder result |
	fBlock := [ :x | |r| r := x * x. r = 0 ifTrue: [ 1] ifFalse: [ r sqrt sin / r] ].
	finder := DhbMultiVariableGeneralOptimizer maximizingFunction: fBlock.
	finder desiredPrecision: 1.0e-6.
	finder origin: #( 0.5 1.0 0.5) asVector; range: #(2 2 2) asVector.
	result := finder evaluate.
	self should: [ finder precision < 1.0e-6].
	self should: [ (result at: 1) abs < 1.0e-6].
	self should: [ (result at: 2) abs < 1.0e-6].
	self should: [ (result at: 3) abs < 1.0e-6].