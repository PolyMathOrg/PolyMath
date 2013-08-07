as yet unclassified
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [:x :t | 2 * t * x].
	stepper := BDF2Stepper onSystem: system.
	solver := (BDF2Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1.5) closeTo: 11.9167].
	self should: [(solver solve: system startState: 1.25 startTime: 0.5 endTime: 1.5) closeTo:9.5833].
	self should: [(solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo: 21.9166].
	self should: [(solver solve: system startState: 1.25 startTime: 0.5 endTime: 2.5) closeTo:273.7129].