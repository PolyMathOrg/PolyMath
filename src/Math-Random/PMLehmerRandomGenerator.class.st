"
This generator uses the Lehmer's Linear Congruential method.

PMLehmerRandomGenerator new next
"
Class {
	#name : #PMLehmerRandomGenerator,
	#superclass : #PMRandomGenerator,
	#category : #'Math-Random'
}

{ #category : #'stream access' }
PMLehmerRandomGenerator >> next [
    "Answer a Random Float between 0 and 1. Uses Lehmer's linear congruential method."

    ^ self nextFloat
]

{ #category : #private }
PMLehmerRandomGenerator >> nextFloat [
    "Private - Answer a Random Float between 0 and 1. Uses Lehmer's linear congruential method."

    seed := self peekSeed.
    ^ seed / SmallInteger maxVal asFloat
]

{ #category : #'stream access' }
PMLehmerRandomGenerator >> peek [
    "Answer a pseudo-Random floating point number between 0 and 1."

    ^ self peekSeed / SmallInteger maxVal asFloat
]

{ #category : #private }
PMLehmerRandomGenerator >> peekSeed [
    "Private - Answer the next Integer seed calculated using Lehmer's linear congruential
    method. The seed is in the range 0..16r3FFFFFFF."

    ^ ( seed * 31415821 ) + 1 bitAnd: SmallInteger maxVal
]
