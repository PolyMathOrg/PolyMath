instance creation
rungeStepper
	| a b |
	a := DhbMatrix rows: #((0 0) (0.5 0)).
	b := #(0 1).
	^ self stageWeights: b stageCoefficients: a.