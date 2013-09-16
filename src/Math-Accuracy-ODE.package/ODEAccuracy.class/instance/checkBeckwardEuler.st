as yet unclassified
checkBeckwardEuler
	| solver stepper system |
	system := ImplicitSystem block: function.
      stepper := ImplicitStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime