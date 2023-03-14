Class {
	#name : #PMBeckwardEulerStepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMBeckwardEulerStepperTest >> testDoStepTime [
	"this is identical to testDoStepTimeStepSize except dt is stored."

	| stepper sys dt |
	sys := PMImplicitSystem block: [ :x :t | x * t ].
	stepper := PMImplicitStepper onSystem: sys.
	dt := 0.1.
	stepper stepSize: dt.
	self assert: stepper stepSize equals: dt.
	self assert: (stepper doStep: 0 time: 10) equals: 0.101.
	self assert: (stepper doStep: 10 time: 0 stepSize: 1) equals: 21.

	"stepSize parameter changes the stored stepSize"
	self assert: stepper stepSize equals: 1.
	self assert: (stepper doStep: 1 time: 1) equals: 5.
	self
		assert: (stepper doStep: 10 time: 1 stepSize: 0.2)
		equals: 12.448
]

{ #category : #'tests-stepping' }
PMBeckwardEulerStepperTest >> testDoStepTimeStepSize [
	| stepper sys dt |
	sys := PMImplicitSystem block: [ :x :t | x * t ].
	stepper := PMImplicitStepper onSystem: sys.
	dt := 0.1.
	self assert: (stepper doStep: 0 time: 10 stepSize: dt) equals: 0.101.
	self assert: (stepper doStep: 10 time: 0 stepSize: dt) equals: 10.101.
	self assert: (stepper doStep: 1 time: 1 stepSize: dt) equals: 1.121.
	self assert: (stepper doStep: 10 time: 1 stepSize: dt) equals: 11.111
]

{ #category : #'tests-stepping' }
PMBeckwardEulerStepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMImplicitStepper onSystem: system.
	solver := (PMImplicitSolver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo:  2.10408).
      self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo:  -0.5306)
]

{ #category : #'tests-stepping' }
PMBeckwardEulerStepperTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMImplicitStepper onSystem: system.
	solver := PMImplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 0.5)
		closeTo: 1.75
]
