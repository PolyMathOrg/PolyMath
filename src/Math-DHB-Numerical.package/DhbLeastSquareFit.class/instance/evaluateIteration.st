operation
evaluateIteration
		"Dummy method (must be implemented by subclass)."
	| changes maxChange|
	self computeEquationSystem.
	changes := self computeChanges.
	result changeParametersBy: changes.
	maxChange := 0.
	result parameters with: changes do: 
		[ :r :d | maxChange := ( d / r) abs max: maxChange].
	^maxChange