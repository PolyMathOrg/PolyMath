"
This Combined Random Number Generator is based on the algorithm described by PIERRE L'ECUYER in ""Efficient and Portable Combined Random Number Generators"" [Communications of the ACM, June 19, Volume 31, Number 6, pp. 742-749, references p.774]. Taking into account its two-dimensional behaviour (from abovementioned article), this generator is suitable to produce the pairs of consecutive numbers.
For the first linear congruential generator (generator A):
m = 2147483563; a = 40014; q = 53668; r = 12211.
For the second linear congruential generator (generator B):
m = 2147483399; a = 40692; q = 52774; r = 3791.

To produce initial seedA (for the first generator)  the method #nextInt: 2147483562 of Random is used; to produce seedB (for the second)  - the method #nextInt: 2147483398. Corresponding seeds are represented as Floats. The result of work of two generators (the next seedA and seedB) are combined.

Developed by Konstantin Nizheradze <konsnizher@gmail.com> 

Instance Variables:
	random	<Random>
	seedA	<Number>
	seedB	<Number>
"
Class {
	#name : #PMCombinedRandomGenerator,
	#superclass : #Random,
	#instVars : [
		'random',
		'seedA',
		'seedB'
	],
	#category : 'Math-Random'
}

{ #category : #initialize }
PMCombinedRandomGenerator >> initialize [

	super initialize.
	random := Random new.
	seedA := (random nextInt: 2147483562) asFloat.
	seedB := (random nextInt: 2147483398) asFloat
]

{ #category : #accessing }
PMCombinedRandomGenerator >> next [
	"Combine seedA and seedB to produce new seed. Seed is in the interval [0, 1]. "

	 seed := (self nextValueA) - (self nextValueB).
	 seed < 1 ifTrue: [seed := seed + 2.147483562e9].
	 seed := seed *  4.656613057391769e-10.
	^ seed
	
	
]

{ #category : #private }
PMCombinedRandomGenerator >> nextValueA [
	"Evaluate next value of seedA using m and a of generatorA"

	| lo hi aLoRHi |
	hi := (seedA quo: 53668.0) asFloat.
	lo := seedA - (hi * 53668.0).  " = seed rem: q"  
	aLoRHi := ( 40014.0 * lo) - ( 12211.0 * hi).
	seedA := (aLoRHi > 0.0)
		ifTrue:  [aLoRHi]
		ifFalse: [aLoRHi + 2.147483563e9].
	^ seedA
]

{ #category : #private }
PMCombinedRandomGenerator >> nextValueB [
	"Evaluate next value of seedB using m, a, q and r of generatorB"

	| lo hi aLoRHi |
	hi := (seedB quo: 52774.0) asFloat.
	lo := seedB - (hi * 52774.0).  " = seed rem: q"  
	aLoRHi := (40692.0 * lo) - (3791.0 * hi).
	seedB := (aLoRHi > 0.0)
		ifTrue:  [aLoRHi]
		ifFalse: [aLoRHi +  2.147483399e9].
	^ seedB
]
