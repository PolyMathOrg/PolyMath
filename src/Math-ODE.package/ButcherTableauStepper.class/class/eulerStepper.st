instance creation
eulerStepper
	| a b |
	a := DhbMatrix rows: #((0)).
	b := #(1).
	^ self stageWeights: b stageCoefficients: a.