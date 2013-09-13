as yet unclassified
checkAB2
	| solver stepper system |
	system := ExplicitSystem block: function.
	stepper := AB2Stepper onSystem: system.
	solver := (AB2Solver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime