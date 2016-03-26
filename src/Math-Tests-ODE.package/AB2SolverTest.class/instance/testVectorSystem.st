tests-solving
testVectorSystem
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem block: [:x :t | 
												| v |
												v := DhbVector new: 2. 
												v at: 1 put: t sin. 
												v at: 2 put: t cos.
												v].
	stepper := AB2Stepper onSystem: system.
	solver := AB2Solver new stepper: stepper; system: system; dt: dt.
	self assert: (((solver solve: system startState: #(-1 0) startTime: 0 endTime: Float pi ) at: 1) closeTo: 1).
	self assert: (((solver solve: system startState: #(-1 0) startTime: 0 endTime: Float pi / 2 ) at: 2 ) closeTo: 1).