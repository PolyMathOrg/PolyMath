as yet unclassified
testSimpleSystem3
	<expectedFailure>
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem block: [:x :t | 2 * t * x].
	stepper := ImplMidpointStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1) closeTo: 2.6348].