Class {
	#name : 'PMRungeKuttaStepperTest',
	#superclass : 'PMAbstractTest',
	#category : 'Math-Tests-ODE',
	#package : 'Math-Tests-ODE'
}

{ #category : 'tests-stepping' }
PMRungeKuttaStepperTest >> testDoStepTimeStepSize1 [

	| stepper sys dt |
	sys := PMExplicitSystem block: [ :x :t | x * t ].
	stepper := PMRungeKuttaStepper onSystem: sys.
	dt := 0.1.
	self assert: ((stepper doStep: 0 time: 10 stepSize: dt) closeTo: 0.0 precision: 0.01).
	self assert: ((stepper doStep: 10 time: 0 stepSize: dt) closeTo: 10.05 precision: 0.01).
	self assert: ((stepper doStep: 1 time: 1 stepSize: dt) closeTo: 1.1107 precision: 0.01).
	self assert: ((stepper doStep: 10 time: 1 stepSize: dt) closeTo: 11.1071 precision: 0.01)
]

{ #category : 'tests-stepping' }
PMRungeKuttaStepperTest >> testDoStepTimeStepSize2 [

	| stepper sys dt |
	sys := PMExplicitSystem block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := PMRungeKuttaStepper onSystem: sys.
	dt := 0.1.
	self assert: (stepper doStep: 1 time: 1 stepSize: dt) closeTo: 1.0638.
	self assert: (stepper doStep: 10 time: 1 stepSize: dt) closeTo: 9.7109
]

{ #category : 'tests-stepping' }
PMRungeKuttaStepperTest >> testOrderIsFour [
	self assert: PMRungeKuttaStepper order equals: 4
]

{ #category : 'tests-stepping' }
PMRungeKuttaStepperTest >> testSimpleSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [ :x :t | t sin ].
	stepper := PMRungeKuttaStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: -1
				 startTime: 0
				 endTime: Float pi)
		closeTo: 1
]

{ #category : 'tests-stepping' }
PMRungeKuttaStepperTest >> testSimpleSystem2 [

	| solver stepper system dt |
	dt := 1.5.
	system := PMExplicitSystem block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := PMRungeKuttaStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 5
				 startTime: 0
				 endTime: 1.5)
		closeTo: 4.3646 precision: 0.0001.
	self should: ((solver
			  solve: system
			  startState: 0
			  startTime: 1
			  endTime: 2.5) closeTo: 0.5951 precision: 0.0001)
]

{ #category : 'tests-stepping' }
PMRungeKuttaStepperTest >> testVectorSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [ :x :t |
		          | c |
		          c := PMVector new: 2.
		          c at: 1 put: t sin.
		          c at: 2 put: t cos.
		          c ].
	stepper := PMRungeKuttaStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: ((solver
				  solve: system
				  startState: #( -1 0 )
				  startTime: 0
				  endTime: Float pi) at: 1)
		closeTo: 1.
	self
		assert: ((solver
				  solve: system
				  startState: #( -1 0 )
				  startTime: 0
				  endTime: Float pi / 2) at: 2)
		closeTo: 1
]
