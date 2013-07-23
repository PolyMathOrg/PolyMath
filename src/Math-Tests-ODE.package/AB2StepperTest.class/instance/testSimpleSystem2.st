as yet unclassified
testSimpleSystem2
	| solver stepper system dt |
	dt := 1.5.
	system := ExplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := AB2Stepper onSystem: system.
	solver := (AB2Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo: 3.6756494873345655].
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  1.1236935297353574).