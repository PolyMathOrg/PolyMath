"
A PMMarsagliaKissRandom is a pseudo-random number generator (PRNG) using Marsaglia's Keep it Simple Stupid algorithm.

It generates Float with uniform distribution in Interval [0,1).
The result divided by 1.0 predecessor will be in [0,1].

Instance Variables
	kernelRand1:		<PMMarsagliaKissRandomKernel> a first generator
	kernelRand2:		<PMMarsagliaKissRandomKernel> a second generator

"
Class {
	#name : #PMMarsagliaKissRandom,
	#superclass : #PMRandomGenerator,
	#instVars : [
		'kernelRand1',
		'kernelRand2'
	],
	#category : #'Math-Random'
}

{ #category : #'instance creation' }
PMMarsagliaKissRandom class >> default [
	^self seed: #(
		123456789 362436069 521288629 316191069
		987654321 458629013 582859209 438195021)
]

{ #category : #'instance creation' }
PMMarsagliaKissRandom class >> new [

	^ self seed: (PMMarsagliaKissRandomKernel new next: 8)
]

{ #category : #'stream access' }
PMMarsagliaKissRandom >> next [
	"Answer a Float in interval [0.0,1.0) with uniform distribution.
	Note that constant 16rFFFFF800 is computed so as to truncate the 64 bits to Float precision.
	It is thus ((1 << 32 - 1 << (64 - Float precision) bitAnd: 1 << 32 - 1)) hex"
	^(kernelRand1 next asFloat timesTwoPower: -32)
		+ ((kernelRand2 next bitAnd: 16rFFFFF800) asFloat timesTwoPower: -64)
]

{ #category : #'stream access' }
PMMarsagliaKissRandom >> peek [
	^self copy next
]

{ #category : #copying }
PMMarsagliaKissRandom >> postCopy [
	kernelRand1 := kernelRand1 copy.
	kernelRand2 := kernelRand2 copy
]

{ #category : #accessing }
PMMarsagliaKissRandom >> seed [
	^ kernelRand1 seed , kernelRand2 seed
]

{ #category : #accessing }
PMMarsagliaKissRandom >> seed: aWordArray [
	"Initialize with an Array of eight 32-bits Integer"
	kernelRand1 := PMMarsagliaKissRandomKernel seed: (aWordArray first: 4).
	kernelRand2 := PMMarsagliaKissRandomKernel seed: (aWordArray last: 4)
]
