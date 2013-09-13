as yet unclassified
checkImplicitMidpoint
	| solver stepper system |
	system := ImplicitSystem block: function.
      stepper := ImplicitMidpointStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime