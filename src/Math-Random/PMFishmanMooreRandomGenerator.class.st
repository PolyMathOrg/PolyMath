"
I am a simple implementation of Fishman-Moore pseudo-random number generator.

Onghena, P. A theoretical and empirical comparison of mainframe, microcomputer, and pocket calculator pseudorandom number generators. Behavior Research Methods, Instruments, & Computers 25, 384–395 (1993). https://doi.org/10.3758/BF03204529
"
Class {
	#name : #PMFishmanMooreRandomGenerator,
	#superclass : #PMPseudoRandomNumberGenerator,
	#category : #'Math-Random'
}

{ #category : #initialization }
PMFishmanMooreRandomGenerator >> initialize [
	super initialize.
	seed := Time millisecondClockValue
]

{ #category : #accessing }
PMFishmanMooreRandomGenerator >> next [
	^ (seed := 742938285 * seed \\ 2147483647) / 2147483647.0
]

{ #category : #accessing }
PMFishmanMooreRandomGenerator >> nextInt: anInteger [
	^ (self next * anInteger) truncated + 1
]

{ #category : #accessing }
PMFishmanMooreRandomGenerator >> peek [
	^ 742938285 * seed \\ 2147483647 / 2147483647.0
]

{ #category : #accessing }
PMFishmanMooreRandomGenerator >> seed [
	^ seed
]

{ #category : #accessing }
PMFishmanMooreRandomGenerator >> seed: anInteger [
	seed := anInteger asInteger
]
