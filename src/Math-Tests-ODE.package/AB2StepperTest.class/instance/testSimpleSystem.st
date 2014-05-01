tests-stepping
testSimpleSystem
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem block: [:x :t | t sin].
	stepper := AB2Stepper onSystem: system.
	solver := (AB2Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: -1 startTime: 0 endTime: Float pi) closeTo: 1].
	