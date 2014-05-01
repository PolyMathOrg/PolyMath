tests-solving
testSimpleSystem2
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := BDF3Stepper onSystem: system.
	solver := (BDF3Solver new) stepper: stepper; system: system; dt: dt.
	
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  0.54985).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo:  -0.5306).