as yet unclassified
testSimpleSystem
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem block: [:x :t | t sin].
	stepper := ImplMidpointStepper onSystem: system.
	solver := (ImplMidpointSolver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: -1 startTime: 0 endTime: Float pi) closeTo: 1].