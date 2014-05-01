tests-solving
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [:x :t | 2 * t * x].
	stepper := BDF4Stepper onSystem: system.
	solver := (BDF4Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 0.25 startTime: 0.5 endTime: 2.0) closeTo: 13.4091].
	self should: [(solver solve: system startState: 0.25 startTime: 0.5 endTime: 2.3) closeTo: 41.21625].
	self should: [(solver solve: system startState: 0.25 startTime: 0.5 endTime: 2.5) closeTo: 69.9482].
	self should: [(solver solve: system startState: 0 startTime: 1 endTime: 2.8) closeTo: 71.9236].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1.5) closeTo: 11.0227].