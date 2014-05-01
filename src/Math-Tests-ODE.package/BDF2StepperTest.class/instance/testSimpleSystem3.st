tests-stepping
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [:x :t | 2 * t * x].
	stepper := BDF2Stepper onSystem: system.
	solver := (BDF2Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 0.2) closeTo: 1.3].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 0.5) closeTo: 1.75].
	self should: [(solver solve: system startState: 1.25 startTime: 0.5 endTime: 1.3) closeTo: 6.0793].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1.3) closeTo: 	7.5367].