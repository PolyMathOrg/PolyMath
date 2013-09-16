as yet unclassified
testSimpleSystem2
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := ImplicitStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  0.16567).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo: -0.5306).