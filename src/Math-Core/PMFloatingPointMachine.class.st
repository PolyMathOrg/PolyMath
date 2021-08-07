"
A `PMFloatingPointMachine` represents the numerical precision of this system.

##Instance Variables

- `defaultNumericalPrecision`	The relative numerical precision that can be expected for a general numerical computation. One should consider to numbers a and b equal if the relative difference between them is less than the default machine precision,
- `largestExponentArgument` Natural logarithm of largest number,
- `largestNumber` The largest positive number that can be represented in the machine,
- `machinePrecision` $r^{-(n+1)}$, with the largest n such that $(1 + r^{-n}) - 1$ != 0,
- `negativeMachinePrecision` $r^{-(n+1)}$, with the largest n such that $(1 - r^{-n}) - 1$ != 0,
- `radix` The radix of the floating point representation. This is often 2,
- `smallNumber` A number that can be added to some value without noticeably changing the result of the computation,
- `smallestNumber` The smallest positive number different from 0.

This class is detailed in Object Oriented Implementation of Numerical Methods, Section 1.4.1 and 1.4.2.

"
Class {
	#name : #PMFloatingPointMachine,
	#superclass : #Object,
	#instVars : [
		'defaultNumericalPrecision',
		'radix',
		'machinePrecision',
		'negativeMachinePrecision',
		'smallestNumber',
		'largestNumber',
		'smallNumber',
		'largestExponentArgument'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Math-Core'
}

{ #category : #'instance creation' }
PMFloatingPointMachine class >> new [
	UniqueInstance ifNil: [ UniqueInstance := super new ].
	^ UniqueInstance
]

{ #category : #accessing }
PMFloatingPointMachine class >> reset [
	UniqueInstance := nil
]

{ #category : #information }
PMFloatingPointMachine >> computeLargestNumber [

	| one floatingRadix fullMantissaNumber |
	one := 1.0.
	floatingRadix := self radix asFloat.
	fullMantissaNumber := one - ( floatingRadix * self negativeMachinePrecision).
	largestNumber := fullMantissaNumber.
	[ [ fullMantissaNumber := fullMantissaNumber * floatingRadix.
	    fullMantissaNumber isInfinite ifTrue: [^nil].
	    largestNumber := fullMantissaNumber.
		true] whileTrue: [ ].
		] on: Error do: [ :signal | signal return: nil]
]

{ #category : #information }
PMFloatingPointMachine >> computeMachinePrecision [
	
	| one zero inverseRadix tmp |
	one := 1.0.
	zero := 0.0.
	inverseRadix := one / self radix asFloat.
	machinePrecision := one.
	[ tmp := one + machinePrecision.
	  tmp - one = zero]
		whileFalse:[  machinePrecision := machinePrecision * inverseRadix]
]

{ #category : #information }
PMFloatingPointMachine >> computeNegativeMachinePrecision [
	
	| one zero floatingRadix inverseRadix tmp |
	one := 1.0.
	zero := 0.0.
	floatingRadix := self radix asFloat.
	inverseRadix := one / floatingRadix.
	negativeMachinePrecision := one.
	[ tmp := one - negativeMachinePrecision.
	  tmp - one = zero]
		whileFalse:[ negativeMachinePrecision := negativeMachinePrecision * inverseRadix]
]

{ #category : #information }
PMFloatingPointMachine >> computeRadix [
	
	| one zero a b tmp1 tmp2|
	one := 1.0.
	zero := 0.0.
	a := one.
	[ a := a + a.
	  tmp1 := a + one.
	  tmp2 := tmp1 - a.
	  tmp2 - one = zero] whileTrue:[].
	b := one.
	[ b := b + b.
	  tmp1 := a + b.
	  radix := ( tmp1 - a) truncated.
	  radix = 0 ] whileTrue: []
]

{ #category : #information }
PMFloatingPointMachine >> computeSmallestNumber [
	
	| one floatingRadix inverseRadix fullMantissaNumber |
	one := 1 asFloat.
	floatingRadix := self radix asFloat.
	inverseRadix := one / floatingRadix.
	fullMantissaNumber := one - (floatingRadix * self negativeMachinePrecision).
	smallestNumber := fullMantissaNumber.
	[[fullMantissaNumber := fullMantissaNumber * inverseRadix.
	fullMantissaNumber = 0.0 ifTrue: [Error signal ].
	smallestNumber := fullMantissaNumber.
	true]
		whileTrue: []]
		on: Error do: [:signal | signal return: nil]
]

{ #category : #information }
PMFloatingPointMachine >> defaultNumericalPrecision [

	defaultNumericalPrecision isNil
		ifTrue: [ defaultNumericalPrecision := self machinePrecision sqrt].
	^defaultNumericalPrecision
]

{ #category : #information }
PMFloatingPointMachine >> largestExponentArgument [
	
	largestExponentArgument isNil
		ifTrue: [ largestExponentArgument := self largestNumber ln].
	^largestExponentArgument
]

{ #category : #information }
PMFloatingPointMachine >> largestNumber [
	
	largestNumber isNil
		ifTrue: [ self computeLargestNumber].
	^largestNumber
]

{ #category : #information }
PMFloatingPointMachine >> machinePrecision [
	
	machinePrecision isNil
		ifTrue: [ self computeMachinePrecision].
	^machinePrecision
]

{ #category : #information }
PMFloatingPointMachine >> negativeMachinePrecision [
	
	negativeMachinePrecision isNil
		ifTrue: [ self computeNegativeMachinePrecision].
	^negativeMachinePrecision
]

{ #category : #information }
PMFloatingPointMachine >> radix [
	
	radix isNil
		ifTrue: [ self computeRadix].
	^radix
]

{ #category : #display }
PMFloatingPointMachine >> showParameters [

	Transcript cr; cr;
			nextPutAll: 'Floating-point machine parameters'; cr;
			nextPutAll: '---------------------------------';cr;
			nextPutAll: 'Radix: '.
	self radix printOn: Transcript.
	Transcript cr; nextPutAll: 'Machine precision: '.
	self machinePrecision printOn: Transcript.
	Transcript cr; nextPutAll: 'Negative machine precision: '.
	self negativeMachinePrecision printOn: Transcript.
	Transcript cr; nextPutAll: 'Smallest number: '.
	self smallestNumber printOn: Transcript.
	Transcript cr; nextPutAll: 'Largest number: '.
	self largestNumber printOn: Transcript.
	Transcript flush
]

{ #category : #information }
PMFloatingPointMachine >> smallNumber [
	
	smallNumber isNil
		ifTrue: [ smallNumber := self smallestNumber sqrt].
	^smallNumber
]

{ #category : #information }
PMFloatingPointMachine >> smallestNumber [
	
	smallestNumber isNil
		ifTrue: [ self computeSmallestNumber].
	^smallestNumber
]
