operation
computeEquationSystem
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/3/99 "
	constants atAllPut: 0.
	equations do: [ :each | each atAllPut: 0].
	self accumulateEquationSystem.