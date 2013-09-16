as yet unclassified
testSimpleSystem4
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [:x :t |  2 * (36 * (( t ln ) ** 2) + (6 * (t ln)) +7 )  /
		 ((t ** 3) * (1- (6 * (t ln))) ** 2)].
	stepper := AB2Stepper onSystem: system.
	solver := (AB2Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(  solver solve: system startState: 2 startTime: 1 endTime: 4.5  ) closeTo: 22.3431].
	
