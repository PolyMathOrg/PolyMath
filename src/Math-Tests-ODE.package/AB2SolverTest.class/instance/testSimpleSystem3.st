tests-solving
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t | 2 * t * x].
	stepper := AB2Stepper onSystem: system.
	solver := AB2Solver new stepper: stepper; system: system; dt: dt.
	self assert: ((solver solve: system startState: 1 startTime: 0 endTime: 1  ) closeTo: 2.1875).
	self assert: ((solver solve: system startState: 1.25 startTime: 0.5 endTime: 2  ) closeTo: 17.4512).
