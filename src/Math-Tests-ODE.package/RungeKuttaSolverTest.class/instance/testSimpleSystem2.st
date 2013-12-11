as yet unclassified
testSimpleSystem2
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := RungeKuttaStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo: 4.3724].
	self should: [(solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo: 2.7629].
	self should: [(solver solve: system startState: 1 startTime: 0 endTime: 1.1) closeTo: 2.1997]