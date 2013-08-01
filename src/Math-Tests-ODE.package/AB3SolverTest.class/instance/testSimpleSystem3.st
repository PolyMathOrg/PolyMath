as yet unclassified
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t | 2 * t * x].
	stepper := AB3Stepper onSystem: system.
	solver := (AB3Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(  solver solve1: system startState: 1 startTime: 0 endTime: 1.7  ) closeTo: 10.8633].
	self should: [(  solver solve1: system startState: 1 startTime: 0 endTime: 1  ) closeTo: 2.1875].
	self should: [(  solver solve1: system startState: 1 startTime: 0 endTime: 1.5  ) closeTo: 5.546875].