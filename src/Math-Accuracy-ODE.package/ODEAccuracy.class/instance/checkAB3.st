as yet unclassified
checkAB3
	| solver stepper system |
	system := ExplicitSystem block: function.
	stepper := AB3Stepper onSystem: system.
	solver := (AB3Solver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime