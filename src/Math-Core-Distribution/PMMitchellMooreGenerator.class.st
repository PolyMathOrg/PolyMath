Class {
	#name : #PMMitchellMooreGenerator,
	#superclass : #Object,
	#instVars : [
		'randoms',
		'lowIndex',
		'highIndex'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Math-Core-Distribution'
}

{ #category : #creation }
PMMitchellMooreGenerator class >> constants: anArray lowIndex: anInteger [

	^super new initialize: anArray lowIndex: anInteger
]

{ #category : #creation }
PMMitchellMooreGenerator class >> default [

	| congruentialGenerator |
	congruentialGenerator := PMCongruentialRandomNumberGenerator new.
	^self generateSeeds: congruentialGenerator
]

{ #category : #creation }
PMMitchellMooreGenerator class >> generateSeeds: congruentialGenerator [
	"Private- "
	^self constants: ((1 to: 55) collect: [:n | congruentialGenerator floatValue])
		lowIndex: 24
]

{ #category : #creation }
PMMitchellMooreGenerator class >> new [
	UniqueInstance isNil
		ifTrue: [ UniqueInstance := self default].
	^UniqueInstance
]

{ #category : #creation }
PMMitchellMooreGenerator class >> reset: anInteger [
	"Reset the unique instance used for the default series"
	UniqueInstance := self seed: anInteger.
]

{ #category : #creation }
PMMitchellMooreGenerator class >> seed: anInteger [

	| congruentialGenerator |
	congruentialGenerator := PMCongruentialRandomNumberGenerator seed: anInteger.
	^self generateSeeds: congruentialGenerator
]

{ #category : #information }
PMMitchellMooreGenerator >> floatValue [

	| x |
	x := (randoms at: lowIndex) + (randoms at: highIndex).
	x < 1.0 ifFalse: [x := x - 1.0].
	randoms at: highIndex put: x.
	highIndex := highIndex + 1.
	highIndex > randoms size ifTrue: [highIndex := 1].
	lowIndex := lowIndex + 1.
	lowIndex > randoms size ifTrue: [lowIndex := 1].
	^x
]

{ #category : #initialization }
PMMitchellMooreGenerator >> initialize: anArray lowIndex: anInteger [

	randoms := anArray.
	lowIndex := anInteger.
	highIndex := randoms size
]

{ #category : #information }
PMMitchellMooreGenerator >> integerValue: anInteger [

	^( self floatValue * anInteger) truncated
]
