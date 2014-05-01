tests-stepping
testSimpleSystem2
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := BDF3Stepper onSystem: system.
	solver := (BDF3Solver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.7) closeTo:  1.10147).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo:  2.10409).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3.0) closeTo:  0.54985).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 4.0) closeTo:  -0.71539).