"
A `PMFloatingPointMachine` represents the numerical precision of this system.

##Instance Variables

- `defaultNumericalPrecision`	The relative numerical precision that can be expected for a general numerical computation. One should consider to numbers a and b equal if the relative difference between them is less than the default machine precision,
- `machinePrecision` $r^{-(n+1)}$, with the largest n such that $(1 + r^{-n}) - 1$ != 0,
- `negativeMachinePrecision` $r^{-(n+1)}$, with the largest n such that $(1 - r^{-n}) - 1$ != 0

This class is detailed in Object Oriented Implementation of Numerical Methods, Section 1.4.1 and 1.4.2.

"
Class {
	#name : #PMFloatingPointMachine,
	#superclass : #Object,
	#instVars : [
		'defaultNumericalPrecision',
		'machinePrecision',
		'negativeMachinePrecision'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Math-Helpers'
}

{ #category : #'instance creation' }
PMFloatingPointMachine class >> new [
	UniqueInstance ifNil: [ UniqueInstance := super new ].
	^ UniqueInstance
]

{ #category : #accessing }
PMFloatingPointMachine class >> reset [

	<script>
	UniqueInstance := nil
]

{ #category : #information }
PMFloatingPointMachine >> computeMachinePrecision [

	| one zero inverseRadix tmp |
	one := 1.0.
	zero := 0.0.
	inverseRadix := one / Float radix asFloat.
	machinePrecision := one.
	[
	tmp := one + machinePrecision.
	tmp - one = zero ] whileFalse: [ machinePrecision := machinePrecision * inverseRadix ]
]

{ #category : #information }
PMFloatingPointMachine >> computeNegativeMachinePrecision [

	| one zero floatingRadix inverseRadix tmp |
	one := 1.0.
	zero := 0.0.
	floatingRadix := Float radix asFloat.
	inverseRadix := one / floatingRadix.
	negativeMachinePrecision := one.
	[
	tmp := one - negativeMachinePrecision.
	tmp - one = zero ] whileFalse: [ negativeMachinePrecision := negativeMachinePrecision * inverseRadix ]
]

{ #category : #information }
PMFloatingPointMachine >> defaultNumericalPrecision [

	defaultNumericalPrecision ifNil: [ defaultNumericalPrecision := self machinePrecision sqrt ].
	^ defaultNumericalPrecision
]

{ #category : #information }
PMFloatingPointMachine >> machinePrecision [

	machinePrecision ifNil: [ self computeMachinePrecision ].
	^ machinePrecision
]

{ #category : #information }
PMFloatingPointMachine >> negativeMachinePrecision [

	negativeMachinePrecision ifNil: [ self computeNegativeMachinePrecision ].
	^ negativeMachinePrecision
]
