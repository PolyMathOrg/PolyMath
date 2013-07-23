as yet unclassified
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t | 2 * t * x].
	stepper := MidpointStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 0.5) closeTo: 1.25].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1) closeTo: 2.421875].