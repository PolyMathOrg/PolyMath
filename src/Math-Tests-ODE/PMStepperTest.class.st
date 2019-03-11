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
	self assert: Stepper order isNil
]

{ #category : #tests }
PMStepperTest >> testOrderIsNilForInstanceOfBaseClass [
	self assert: Stepper new order isNil
]

{ #category : #tests }
PMStepperTest >> testSystem [
	| stepper sys |
	sys := ExplicitSystem new.
	sys block: [ :x :t | t ].
	stepper := Stepper onSystem: sys.
	self assert: stepper system equals: sys.
	sys := ExplicitSystem new.
	self shouldnt: [ stepper system = sys ]
]
