Class {
	#name : #PMFloatingPointMachineTestCase,
	#superclass : #TestCase,
	#category : #'Math-Tests-Numerical'
}

{ #category : #precision }
PMFloatingPointMachineTestCase >> testMachinePrecisionLargestNumberNotInfinity [
	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach largestNumber < Float infinity
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
	self assert: mach1 == mach2.
	PMFloatingPointMachine reset.
	mach3 := PMFloatingPointMachine new.
	self shouldnt: [ mach3 == mach2 ]
]
