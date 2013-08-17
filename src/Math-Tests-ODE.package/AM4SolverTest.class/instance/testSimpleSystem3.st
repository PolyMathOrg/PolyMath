as yet unclassified
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [:x :t | 2 * t * x].
	stepper := AM4Stepper onSystem: system.
	solver := (AM4Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1.5) closeTo: 15.2741].
	self should: [(solver solve: system startState: 1.25 startTime: 0.5 endTime: 2.2) closeTo: 191.3011].
	self should: [(solver solve: system startState: 0.5 startTime: 1 endTime: 2.5) closeTo: 112.8325].
	self should: [(solver solve: system startState: 0.5 startTime: 1 endTime: 2.8) closeTo: 535.8236].