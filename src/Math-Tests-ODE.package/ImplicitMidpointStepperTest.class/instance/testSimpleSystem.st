tests-stepping
testSimpleSystem
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem block: [:x :t | t sin].
	stepper := ImplicitMidpointStepper onSystem: system.
	solver := (ImplicitMidpointSolver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: -1 startTime: 0 endTime: Float pi) closeTo: 1].