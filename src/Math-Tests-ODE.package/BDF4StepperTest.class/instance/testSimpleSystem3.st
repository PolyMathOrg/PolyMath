tests-stepping
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [:x :t | 2 * t * x].
	stepper := BDF4Stepper onSystem: system.
	solver := (BDF4Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 0.5) closeTo: 1.75].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1.0) closeTo: 3.75].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1.5) closeTo: 	11.0227].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 2.0) closeTo: 	43.2181].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 2.3) closeTo: 	132.2771].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 2.5) closeTo: 	224.881].