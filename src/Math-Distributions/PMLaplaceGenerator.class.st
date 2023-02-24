"
I'm a random number generator whose values are distributed according to  Laplace distribution.

Ideally this class should be a subclass of  RandomGenerator 
however it is unclear how to implement peek.
"
Class {
	#name : #PMLaplaceGenerator,
	#superclass : #Object,
	#instVars : [
		'laplaceDistribution',
		'next'
	],
	#category : #'Math-Distributions'
}

{ #category : #testing }
PMLaplaceGenerator class >> isDeprecated [

	"I am just a wrapper for Laplace distribution. The Distribution should be used directly as it is."

	^ true
]

{ #category : #'instance creation' }
PMLaplaceGenerator class >> shape: peakValue scale: falloffValue [

	^ self new shape: peakValue scale: falloffValue
]

{ #category : #accessing }
PMLaplaceGenerator >> next [ 

	next := laplaceDistribution random.
	^ next
]

{ #category : #accessing }
PMLaplaceGenerator >> peek [

	next ifNil: [ self next. ].
	^ next
]

{ #category : #creation }
PMLaplaceGenerator >> shape: peakValue scale: falloffValue [

	laplaceDistribution := PMLaplaceDistribution shape: peakValue scale: falloffValue
]
