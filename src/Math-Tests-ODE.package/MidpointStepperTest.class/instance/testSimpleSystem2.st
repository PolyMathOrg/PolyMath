as yet unclassified
testSimpleSystem2
	| solver stepper system dt |
	dt := 1.5.
	system := ExplicitSystem block: [:x :t | 3 * t negated exp - (0.4 * x)].
	stepper := MidpointStepper onSystem: system.
	solver := (ODESolver new) stepper: stepper; system: system; dt: dt.
	self should: [(solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo: 2.3049].
	