as yet unclassified
testSimpleSystem2
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := BDF4Stepper onSystem: system.
	solver := (BDF4Solver new) stepper: stepper; system: system; dt: dt.
	
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  2.5637).
      self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo:  0.4395).
	self should: ((solver solve: system startState: 0 startTime: 0 endTime: 3) closeTo:  1.0793).