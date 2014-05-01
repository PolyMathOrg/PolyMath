tests-stepping
testSimpleSystem3
	
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [:x :t | 2 * t * x].
	stepper := ImplicitStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 0.5) closeTo: 1.75].