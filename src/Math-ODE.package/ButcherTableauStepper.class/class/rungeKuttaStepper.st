instance creation
rungeKuttaStepper
	| a b |
	a := DhbMatrix rows: #((0 0 0 0) (0.5 0 0 0) (0 0.5 0 0) (0 0 1 0)).
	b := #((1 / 6) (1 / 3) (1 / 3) (1 / 6)).
	^ self stageWeights: b stageCoefficients: a.