instance creation
kuttaThreeEighthsStepper
	| a b |
	a := DhbMatrix rows: #((0 0 0 0) ((1 / 3) 0 0 0) ((-1 / 3 ) 1 0 0) (0 1 -1 1)).
	b := #((1 / 8) (3 / 8) (3 / 8) (1 / 8)).
	^ self stageWeights: b stageCoefficients: a.