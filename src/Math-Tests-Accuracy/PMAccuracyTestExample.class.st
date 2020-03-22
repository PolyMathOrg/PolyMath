"
used for tests. if you want to see how to subclass Accuracy, you only need to look at initialize, initializeXXX and checkXXX, the rest is only for AccuracyTest.
if you want to see its output, just 'print it':
AccuracyTestExample new run.

"
Class {
	#name : #PMAccuracyTestExample,
	#superclass : #PMAccuracy,
	#instVars : [
		'count'
	],
	#category : #'Math-Tests-Accuracy'
}

{ #category : #private }
PMAccuracyTestExample >> argumentWith: key [ 
	| r |
	r := self argumentAt: key.
	numberOfResults ifNotNil: [ :rn | r := r at: rn ].
	^ r
]

{ #category : #tests }
PMAccuracyTestExample >> checkAaa [
	self argument first
		ifTrue: [ ^ #(1 1) ].
	^ Array with: (4 + (0.4 * Random new next)) with: 2
]

{ #category : #tests }
PMAccuracyTestExample >> checkBbb [
	^ self argument first size + self parameter first
]

{ #category : #tests }
PMAccuracyTestExample >> checkCcc [
	^ self argument first + (0.01 * self parameter first)
]

{ #category : #tests }
PMAccuracyTestExample >> checkDdd [
	^ OrderedCollection with: 2 with: 3
]

{ #category : #tests }
PMAccuracyTestExample >> checkEee [
	^ Array with: self parameter first with: 3
]

{ #category : #tests }
PMAccuracyTestExample >> checkFff [
	^ Array with: 0 with: 0 with: 1 with: 0 with: Float nan
]

{ #category : #private }
PMAccuracyTestExample >> count [
	^ count
]

{ #category : #private }
PMAccuracyTestExample >> findKey [
	| s selector |
	s := thisContext sender.
	selector := s sender method selector.
	^ self findKey: selector
]

{ #category : #private }
PMAccuracyTestExample >> findKey: selector [
	| matchingMessage |
	selector = 'initialize'
		ifTrue: [ ^ 'AllTheRest' ].
	matchingMessage := names
		detect: [ :name | selector endsWith: name ]
		ifNone: [ 'AllTheRest' ].
	^ matchingMessage
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initialize [
	"this is always necessarily the first thing:"

	super initialize.
	"this is only for testSetup:"
	count := 0.
	"now you can set defaults:"
	self result: #(#(2) #(3)).
	self argument: #(#('a') #('AG')).
	self parameter: #(#(1) #(3))
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeAaa [
	"this overrides defaults in #initialize:"

	self result: #(#(5 3) #(4 4)).
	self map: 'Aaa' to: #(#(false) #(true)).
	self parameter: #(#(1 2) #(3 2.8888))
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeCcc [
	"this overrides defaults in initialize"

	self result: #(#(1) #(1) #(1)).
	self map: 'Ccc' to: #(#(1) #(1.1) #(0.9))
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeDdd [
	"this overrides defaults in initialize"

	self result: #(1.1 2.2).
	self map: 'Ddd' to: #(). 
	self parameter: #()
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeEee [
	"this overrides defaults in initialize"

	self result: #(#(1.1 2.2) #(1 3))
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeFff [
	"this overrides defaults in initialize"

	self result: #(0 1 0 -2 3).
	self map: 'Fff' to: nil.
	self parameter: nil
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> map: key to: anArgument [
	arguments
		at: key
		put: (anArgument ifNotNil: [ :a | self asArray: a ]).
	^ anArgument
]

{ #category : #running }
PMAccuracyTestExample >> setUp [
	count := count + 1
]

{ #category : #running }
PMAccuracyTestExample >> tearDown [
	count := count - (1 / 5)
]

{ #category : #private }
PMAccuracyTestExample >> testGetterAaa [
^Array
	with: self parameter
	with: (self argumentWith: 'Aaa')
	with: (self resultsAt: 'Aaa')
	with: (self numberOfDifferentParametersAt: 'Aaa')
	with: (self numberOfDifferentResultsAt: 'Aaa')
]

{ #category : #private }
PMAccuracyTestExample >> testGetterBbb [
^Array
	with: self parameter
	with: (self argumentWith: 'Bbb')
	with: (self resultsAt: 'Bbb')
	with: (self numberOfDifferentParametersAt: 'Bbb')
	with: (self numberOfDifferentResultsAt: 'Bbb')
]
