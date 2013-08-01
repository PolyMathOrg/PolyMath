as yet unclassified
testSimpleSystem
	| solver stepper system dt |
	dt := 0.0001.
	system := ExplicitSystem block: [:x :t | t sin].
	stepper := AB3Stepper onSystem: system.
	solver := (AB3Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve1: system startState: -1 startTime: 0 endTime: Float pi) closeTo: 1].