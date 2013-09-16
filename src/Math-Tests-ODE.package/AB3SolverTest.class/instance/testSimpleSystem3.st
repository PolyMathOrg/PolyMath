as yet unclassified
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t | 2 * t * x].
	stepper := AB3Stepper onSystem: system.
	solver := (AB3Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(  solver solve: system startState: 1 startTime: 0 endTime: 1  ) closeTo: 2.1875].
	self should: [(  solver solve: system startState: 1.25 startTime: 0.5 endTime: 2  ) closeTo: 19.2822].