Class {
	#name : #PMCongruentialRandomNumberGenerator,
	#superclass : #Object,
	#instVars : [
		'constant',
		'modulus',
		'multiplicator',
		'seed'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Math-Distributions'
}

{ #category : #creation }
PMCongruentialRandomNumberGenerator class >> constant: aNumber1 multiplicator: aNumber2 modulus: aNumber3 [

	^super new
		initialize: aNumber1
		multiplicator: aNumber2
		modulus: aNumber3
]

{ #category : #creation }
PMCongruentialRandomNumberGenerator class >> new [
	"Create a new instance of the receiver with D. Knuth's constants."

	UniqueInstance ifNil: [
		UniqueInstance := super new initialize.
		UniqueInstance setSeed: 1 ].
	^ UniqueInstance
]

{ #category : #creation }
PMCongruentialRandomNumberGenerator class >> seed: aNumber [
	"Create a new instance of the receiver with given seed using D. Knuth's constants."
	^ super new initialize; setSeed: aNumber; yourself
]

{ #category : #information }
PMCongruentialRandomNumberGenerator >> floatValue [
	"Answer the next pseudo-random value between 0 and 1."
	^self value asFloat / modulus
]

{ #category : #initialization }
PMCongruentialRandomNumberGenerator >> initialize [

	self initialize: 2718281829.0 multiplicator: 3141592653.0 modulus: 4294967296.0
]

{ #category : #initialization }
PMCongruentialRandomNumberGenerator >> initialize: aNumber1 multiplicator: aNumber2 modulus: aNumber3 [

	constant := aNumber1.
	modulus := aNumber2.
	multiplicator := aNumber3.
	self setSeed: 1
]

{ #category : #information }
PMCongruentialRandomNumberGenerator >> integerValue: anInteger [
	"Answer a random integer between 0 and the anInteger."
	^( self value  \\ ( anInteger * 1000)) // 1000
]

{ #category : #transformation }
PMCongruentialRandomNumberGenerator >> setSeed: aNumber [
	"Set the seed of the receiver to aNumber."
	seed := aNumber
]

{ #category : #information }
PMCongruentialRandomNumberGenerator >> value [
	"Answer the next pseudo-random value."
	seed := ( seed * multiplicator + constant) \\ modulus.
	^seed
]
