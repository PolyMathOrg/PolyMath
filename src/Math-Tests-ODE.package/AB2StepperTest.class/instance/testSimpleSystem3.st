tests-stepping
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t | 2 * t * x].
	stepper := AB2Stepper onSystem: system.
	solver := (AB2Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 0.2) closeTo: 1.04].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 0.5) closeTo: 1.25].
	self should: [(solver solve: system startState: 1.25 startTime: 0.5 endTime: 1) closeTo: 2.4219].
	self should: [(solver solve: system startState: 2.4219 startTime: 0.5 endTime: 1) closeTo: 4.6924].