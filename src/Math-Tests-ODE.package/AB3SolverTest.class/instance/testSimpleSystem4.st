tests-solving
testSimpleSystem4
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t |  (( 2 negated ) * ( t ** 4 ) * ( x ** 2 ) + 1 - (x * (t ** 2 )))/(t ** 3)].
	stepper := AB3Stepper onSystem: system.
	solver := (AB3Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(  solver solve: system startState: 2 startTime: 1 endTime: 4.5  ) closeTo: -1.6539239077654698e49].