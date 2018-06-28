"
Uses Park and Miller's 'Minimum Standard' Congruential generator. See 'Numerical Recipes in C', 2nd Edition; Press, Flannery, Teukolsky and Vetterling; Cambridge University Press, 1992.

PMRandom new next
"
Class {
	#name : #PMParkMillerMinimumRandomGenerator,
	#superclass : #PMRandomGenerator,
	#category : 'Math-Random'
}

{ #category : #accessing }
PMParkMillerMinimumRandomGenerator >> next [
    "Answer a pseudo-Random floating point number between 0 and 1.
    Uses Park and Miller's 'Minimum Standard' congruential generator
    (see 'Numerical Recipes in C', 2nd Edition; Press, Flannery,
    Teukolsky and Vetterling; Cambridge University Press, 1992)."

	^ self nextFloat
]

{ #category : #accessing }
PMParkMillerMinimumRandomGenerator >> nextFloat [
    "Answer a pseudo-Random floating point number between 0 and 1.
    Uses Park and Miller's 'Minimum Standard' congruential generator
    (see 'Numerical Recipes in C', 2nd Edition; Press, Flannery,
    Teukolsky and Vetterling; Cambridge University Press, 1992)."

    seed := self peekSeed.
    ^ seed / 16r7FFFFFFF asFloat 
]

{ #category : #accessing }
PMParkMillerMinimumRandomGenerator >> peek [
    "Answer a pseudo-Random floating point number between 0 and 1.
    Uses Park and Miller's 'Minimum Standard' congruential generator."

    ^ self peekSeed / 16r7FFFFFFF asFloat

]

{ #category : #accessing }
PMParkMillerMinimumRandomGenerator >> peekSeed [
    "Answer the next Integer seed calculated using Park and Miller's 'Minimum Standard'
    congruential generator. The seed is in the range 0..16r7FFFFFFF."

    ^ ( seed * ( 7 raisedToInteger: 5 ) ) rem: 16r7FFFFFFF

]

{ #category : #accessing }
PMParkMillerMinimumRandomGenerator >> seed: anInteger [
    "Set the seed of the Random stream to anInteger (or 1 if zero)."

    seed := anInteger max: 1

]
