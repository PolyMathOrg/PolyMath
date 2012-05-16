operation
evaluateIteration
		"Dummy method (must be implemented by subclass).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "
	| changes maxChange|
	self computeEquationSystem.
	changes := self computeChanges.
	result changeParametersBy: changes.
	maxChange := 0.
	result parameters with: changes do: 
		[ :r :d | maxChange := ( d / r) abs max: maxChange].
	^maxChange