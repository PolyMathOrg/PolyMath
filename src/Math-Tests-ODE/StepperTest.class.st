"
A StepperTest is a test class for testing the behavior of Stepper
"
Class {
	#name : #StepperTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-ODE'
}

{ #category : #tests }
StepperTest >> testOrderIsNilForBaseClass [
	self assert: Stepper order isNil
]

{ #category : #tests }
StepperTest >> testOrderIsNilForInstanceOfBaseClass [
	self assert: Stepper new order isNil
]

{ #category : #tests }
StepperTest >> testSystem [
	| stepper sys |
	sys := ExplicitSystem new.
	sys block: [ :x :t | t ].
	stepper := Stepper onSystem: sys.
	self assert: stepper system equals: sys.
	sys := ExplicitSystem new.
	self shouldnt: [ stepper system = sys ]
]
