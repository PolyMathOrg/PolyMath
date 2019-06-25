"
I use a quick and dirty Linear Congruential generator.

PMLinearCongruentialRandomGenerator new next.
"
Class {
	#name : #PMLinearCongruentialRandomGenerator,
	#superclass : #PMPseudoRandomNumberGenerator,
	#category : #'Math-Random'
}

{ #category : #'stream access' }
PMLinearCongruentialRandomGenerator >> next [
	"Answer a pseudo-Random floating point number between 0 and 1. Uses a quick and dirty Linear congruential generator"

	^ self nextFloat
]

{ #category : #accessing }
PMLinearCongruentialRandomGenerator >> nextFloat [
	"Answer a pseudo-Random floating point number between 0 and 1. Uses a quick and dirty Linear congruential generator."

	seed := self peekSeed.
	^ seed / 120050.0
]

{ #category : #'stream access' }
PMLinearCongruentialRandomGenerator >> peek [
	"Answer a pseudo-Random floating point number between 0 and 1.  Uses a simple, but fast, Linear Congruential generator."

	^ self peekSeed / 120050.0
]

{ #category : #accessing }
PMLinearCongruentialRandomGenerator >> peekSeed [
	"Answer the next Integer seed calculated using a quick and dirty Linear congruential generator."

	^ (seed * 2311 + 25367) \\ 120050
]
