"
A MarsagliaKissRandomKernel is a private class for generating pseudo-Random numbers.

It generates 32-bits Integer with uniform distribution in Interval [ 0,16rFFFFFFFF].

It holds the states of the pseudo-random generator, and the kernel generation algorithm.
The algorithm is the one used in libgfortran library.
It is based on Marsaglia's Keep It Simple Stupid 2005 version as in ""double precision RNGs"" in  sci.math.num-analysis  
http://sci.tech-archive.net/Archive/sci.math.num-analysis/2005-11/msg00352.html

It is a combination of:
1) a linear congruential generator with period 2^32
2) a 3-shift shift-register generator of period 2^32-1
3) 2 16-bit multiply with carry generators with a period 597273182964842497 > 2^59

Period of this generator is about 2^123

Previous 1999 version can be found along with discussions in this sci.stat.math newsgroup archive:
http://www.ciphersbyritter.com/NEWS4/RANDC.HTM#369F6FCA.74C7C041@stat.fsu.edu
The shift-register had a permutation of first two shifts (13 and 17) leading to a reduced period.

Warning: this pseudo-random generator is not suitable for cryptography as it could be too easily broken (see http://eprint.iacr.org/2011/007.pdf)

Instance Variables
	jcong:	<Integer> state of the linear congruencial generator
	jsr:		<Integer> state of the 3-shift register generator
	w:		<Integer> state of the first multiply with carry generator
	z:		<Integer> state of the second multiply with carry generator

"
Class {
	#name : #PMMarsagliaKissRandomKernel,
	#superclass : #Object,
	#instVars : [
		'jcong',
		'jsr',
		'w',
		'z'
	],
	#category : 'Math-Random'
}

{ #category : #'instance creation' }
PMMarsagliaKissRandomKernel class >> new [
	| seedGenerator |
	seedGenerator := self seed: ((1 to: 4) collect: [:i | Time millisecondClockValue + i]).
	^self seed: (seedGenerator next: 4)
]

{ #category : #'instance creation' }
PMMarsagliaKissRandomKernel class >> seed: anArrayWithFourIntegers [
	"Anwer a new Random stream with the initial seed anArrayWithFourIntegers."

	^ self basicNew seed: anArrayWithFourIntegers; yourself
]

{ #category : #'stream access' }
PMMarsagliaKissRandomKernel >> next [
	"Anwser a 32 bits positive integer in [0,16rFFFFFFFF]."
	jcong := jcong * 69069 + 1327217885 bitAnd: 16rFFFFFFFF.
	jsr := (jsr bitAnd: 16r0007FFFF) << 13 bitXor: jsr.
	jsr := jsr >> 17 bitXor: jsr.
	jsr := (jsr bitAnd: 16r07FFFFFF) << 5 bitXor: jsr.
	w := (w bitAnd: 16rFFFF) * 18000 + (w >> 16).
	z := (z bitAnd: 16rFFFF) * 30903 + (z >> 16).
	^jcong + jsr + ((w bitAnd: 16rFFFF) << 16) + z bitAnd: 16rFFFFFFFF
]

{ #category : #accessing }
PMMarsagliaKissRandomKernel >> next: anInteger [
	"Answer an Array of anInteger pseudo-random 32 bits integers between 0 and 16rFFFFFFFF."

	^ ( 1 to: anInteger ) 
			collect: [ :i | self next ]
]

{ #category : #accessing }
PMMarsagliaKissRandomKernel >> peek [
	^self copy next
]

{ #category : #accessing }
PMMarsagliaKissRandomKernel >> seed [
	^(WordArray new: 4)
		with: jcong
		with: jsr
		with: w
		with: z
]

{ #category : #accessing }
PMMarsagliaKissRandomKernel >> seed: seedArray [
	jcong := (seedArray at: 1) bitAnd: 16rFFFFFFFF.
	jsr := (seedArray at: 2) bitAnd: 16rFFFFFFFF.
	w := (seedArray at: 3) bitAnd: 16rFFFFFFFF.
	z := (seedArray at: 4) bitAnd: 16rFFFFFFFF.
]
