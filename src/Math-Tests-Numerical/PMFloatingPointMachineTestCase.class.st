Class {
	#name : #PMFloatingPointMachineTestCase,
	#superclass : #TestCase,
	#category : #'Math-Tests-Numerical'
}

{ #category : #precision }
PMFloatingPointMachineTestCase >> testMachinePrecision [

	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach machinePrecision > 0.
	self assert: mach machinePrecision < 1.
	self assert: mach negativeMachinePrecision > 0.
	self assert: mach negativeMachinePrecision < 1.
	self assert: (Float radix raisedTo: mach negativeMachinePrecision) equals: 1.0.
	self assert: (Float radix raisedTo: mach machinePrecision) equals: 1.0
]

{ #category : #precision }
PMFloatingPointMachineTestCase >> testMachinePrecisionIsFloatPrecision [
	"sanity check. Take logs to find the exponent, then compare to Float's method"

	| prec |
	prec := (PMFloatingPointMachine new machinePrecision ln / Float radix ln) negated.
	self assert: prec equals: Float precision
]

{ #category : #precision }
PMFloatingPointMachineTestCase >> testMachinePrecisionLargestNumberGreaterThanAnyFractionOfItself [

	| mach |
	mach := PMFloatingPointMachine new.
	self assert: Float fmax * (1 - mach defaultNumericalPrecision) < Float fmax
]

{ #category : #precision }
PMFloatingPointMachineTestCase >> testMachinePrecisionLargestNumberIsLargest [

	| mach |
	mach := PMFloatingPointMachine new.
	self assert: Float fmax * (1 + mach defaultNumericalPrecision) equals: Float infinity
]

{ #category : #precision }
PMFloatingPointMachineTestCase >> testMachinePrecisionSmallNumberLargerThanSmallestNumber [
	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach smallestNumber < mach smallNumber
]

{ #category : #precision }
PMFloatingPointMachineTestCase >> testMachinePrecisionSmallNumberNotZero [
	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach smallNumber > 0.0
]

{ #category : #precision }
PMFloatingPointMachineTestCase >> testMachinePrecisionSmallestNumberNotZero [
	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach smallestNumber > 0.0
]

{ #category : #precision }
PMFloatingPointMachineTestCase >> testUniqueInstance [

	| mach1 mach2 mach3 |
	mach1 := PMFloatingPointMachine new.
	mach2 := PMFloatingPointMachine new.
	self assert: mach1 identicalTo: mach2.
	PMFloatingPointMachine reset.
	mach3 := PMFloatingPointMachine new.
	self shouldnt: [ mach3 == mach2 ]
]
