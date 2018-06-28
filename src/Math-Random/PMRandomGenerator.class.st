"
I'm  the top abstract class of the pseudo-random numbers generator.

The applications of Pseudo-Random Numbers Generators are many ones:
- Simulations
- Sampling
- Cryptography
- Numeric Analysis
- Games
- Aesthetics

Internally, one can classify Random Number Generator according to several views, so choosing one or another is fully dependent of your requirements:

From the production view, there is always a tradeoff between: speed and safety

Another view, based on the seed they use, is:
- Deterministic: They take the seed value from a specific number. These ones are called  Pseudo random number generators.
- Non-deterministic: They take the seed value from a physical source non-predictable and outside the human control. These are called true Random number generators.

Along these terms, deterministic Random Number Generator  are divided between:
- Normal PRNG
-- Linear Congruential
-- Non-Linear Congruential
- Cryptography safe PRNG (CSPRNG)
-- DSA
-- ECDSA

And finally, there's a taxonomy more related with the internal implementation, based on how the pseudo-generator make its random variables following a distribution function.



"
Class {
	#name : #PMRandomGenerator,
	#superclass : #Object,
	#instVars : [
		'seed'
	],
	#category : 'Math-Random'
}

{ #category : #testing }
PMRandomGenerator class >> chiSquare: range repeating: anInteger [
	"Run a 'chi-square' test on a random number generator, over a range of integers given by range, repeating anInteger times.  
    Answer an Array containing the result of the chi-square test (which should be the same as the range), and the upper and lower bounds for 'good' randomness (assuming that anInteger is at least 10 * range)."

	"LCRandom chiSquare: 100 repeating: 4000"

	| array rand ave |
	array := Array new: range withAll: 0.
	rand := self new.
	anInteger
		timesRepeat:
			[ | temp |
			temp := (rand next * range) truncated + 1.
			array at: temp put: (array at: temp) + 1 ].
	ave := 0.
	array do: [ :each | ave := ave + (each * each) ].
	^ Array
		with: range - (2 * range sqrt)
		with:
			ave * range / anInteger - anInteger asFloat
		with: range + (2 * range sqrt)
]

{ #category : #'instance creation' }
PMRandomGenerator class >> new [
	"Answer a new instance of the receiver"

	^ (self seed: Time millisecondClockValue) initialize
]

{ #category : #'instance creation' }
PMRandomGenerator class >> seed: anInteger [
	"Anwer a new Random stream with the initial seed anInteger."

	^ self basicNew seed: anInteger; yourself
]

{ #category : #testing }
PMRandomGenerator >> atEnd [
	"Answer whether the receiver is at its end - never true for a stream of Random numbers"

	^ false

]

{ #category : #accessing }
PMRandomGenerator >> contents [
	"Answer all of the objects in the collection accessed by the receiver.
	Implementation Notes: Random streams are infinite, so there is no implementation possible."

	^ self shouldNotImplement

]

{ #category : #testing }
PMRandomGenerator >> isReadable [
	"Answer whether the receiver can be read from (i.e. it implements the gettableStream protocol)."

	^ true

]

{ #category : #testing }
PMRandomGenerator >> isWriteable [
	"Answer whether the receiver can be written to (i.e. it implements the puttableStream protocol)."

	^ false

]

{ #category : #'stream access' }
PMRandomGenerator >> next [
 	"Answer a pseudo-Random number"
	
	^ self subclassResponsibility
]

{ #category : #'stream access' }
PMRandomGenerator >> next: anInteger [
	"Answer a collection of size anInteger of pseudo-random Floats between 0 and 1. "

	^ ( 1 to: anInteger ) collect: [ :i | self next ]

]

{ #category : #'stream access' }
PMRandomGenerator >> peek [
	"Answer a pseudo-Random number generated from the next seed,  but do not advance down the stream (i.e. self peek = self peek). "

	^ self subclassResponsibility
]

{ #category : #accessing }
PMRandomGenerator >> seed [
    "Returns the instance var of the receiver for external manipulation"

    ^ seed
]

{ #category : #accessing }
PMRandomGenerator >> seed: anObject [
    "Sets the instance var of the receiver with anObject. (No checking is done)"

    seed := anObject
]
