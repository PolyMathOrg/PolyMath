as yet unclassified
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t | 2 * t * x].
	stepper := AB4Stepper onSystem: system.
	solver := (AB4Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(  solver solve: system startState: 1 startTime: 0 endTime: 1  ) closeTo: 2.1875].
	self should: [(  solver solve: system startState: 1 startTime: 0 endTime: 1.5  ) closeTo: 5.546875].
	self should: [(  solver solve: system startState: 1 startTime: 0 endTime: 1.7  ) closeTo: 11.4082].
	self should: [(  solver solve: system startState: 1 startTime: 0 endTime: 2.0  ) closeTo: 20.2002].
	self should: [(  solver solve: system startState: 1 startTime: 0 endTime: 2.5  ) closeTo: 95.5152].
	