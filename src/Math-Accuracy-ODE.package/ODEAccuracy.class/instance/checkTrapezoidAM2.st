initialization
checkTrapezoidAM2
	| solver stepper system |
	system := ImplicitSystem block: function.
      stepper := TrapezoidStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime