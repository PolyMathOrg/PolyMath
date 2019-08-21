"
A StepperTest is a test class for testing the behavior of Stepper
"
Class {
	#name : #PMStepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #tests }
PMStepperTest >> testOrderIsNilForBaseClass [
	self assert: PMStepper order isNil
]

{ #category : #tests }
PMStepperTest >> testOrderIsNilForInstanceOfBaseClass [
	self assert: PMStepper new order isNil
]

{ #category : #tests }
PMStepperTest >> testSystem [
	| stepper sys |
	sys := PMExplicitSystem new.
	sys block: [ :x :t | t ].
	stepper := PMStepper onSystem: sys.
	self assert: stepper system equals: sys.
	sys := PMExplicitSystem new.
	self shouldnt: [ stepper system = sys ]
]
