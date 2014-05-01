tests-stepping
testSimpleSystem2
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := AM4Stepper onSystem: system.
	solver := (AM4Solver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.7) closeTo:  4.5912).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo:  4.9614).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3.0) closeTo:  2.6231).
       self should: ((solver solve: system startState: 0.1 startTime: 2 endTime: 4.1) closeTo:  0.2908).