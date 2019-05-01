"
A PMNumberGenerator is a stream of numbers. All NumberGenerators respond to #next.

As generator I use a PMRandomGenerator instance as defined by the class message defaultGeneratorClass.
My API is 

- generator: 
- next and peek

By default I use a Park and Miller minimum congruent random number generator. See PMParkMillerMinimumRandomGenerator


"
Class {
	#name : #PMNumberGenerator,
	#superclass : #Object,
	#instVars : [
		'randomNumberGenerator'
	],
	#category : #'Math-Random'
}

{ #category : #factory }
PMNumberGenerator class >> defaultGeneratorClass [

	^ PMParkMillerMinimumRandomGenerator
]

{ #category : #'instance-creation' }
PMNumberGenerator class >> new [
	^ (self basicNew
		generator: self defaultGeneratorClass new)
		initialize;
		yourself
]

{ #category : #accessing }
PMNumberGenerator >> generator [
	^ randomNumberGenerator
]

{ #category : #accessing }
PMNumberGenerator >> generator: aRandomGenerator [
	randomNumberGenerator := aRandomGenerator 
]

{ #category : #'stream accessing' }
PMNumberGenerator >> next [
	^ self subclassResponsibility
]

{ #category : #'stream accessing' }
PMNumberGenerator >> peek [
	"really a subclass responsibility, this may be overriden whenever its more efficient to do so"
	^ (self copy generator: (self generator copy)) next
]
