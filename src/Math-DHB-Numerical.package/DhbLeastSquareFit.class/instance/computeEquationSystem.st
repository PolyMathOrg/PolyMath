operation
computeEquationSystem
		"Private"
	constants atAllPut: 0.
	equations do: [ :each | each atAllPut: 0].
	self accumulateEquationSystem.