"
This test case exercises the findKey: message with some regression tests.
"
Class {
	#name : 'PMAccuracyFindKeyTest',
	#superclass : 'TestCase',
	#instVars : [
		'accuracy'
	],
	#category : 'Math-Tests-Accuracy',
	#package : 'Math-Tests-Accuracy'
}

{ #category : 'tests' }
PMAccuracyFindKeyTest >> assertKeyFor: selector equals: expected [
	self assert: (accuracy findKey: selector) equals: expected
]

{ #category : 'running' }
PMAccuracyFindKeyTest >> setUp [
	super setUp.
	accuracy := PMAccuracyTestExample new
]

{ #category : 'tests' }
PMAccuracyFindKeyTest >> testFindKeyReturnsAllTheRestStringWhenSelectorCorrespondsToNonExistentProperty [
	| selector |
	selector := 'NonExistent'.

	self assertKeyFor: selector equals: 'AllTheRest'
]

{ #category : 'tests' }
PMAccuracyFindKeyTest >> testFindKeyReturnsAllTheRestStringWhenSelectorIsInitialize [
	| selector |
	selector := 'initialize'.

	self assertKeyFor: selector equals: 'AllTheRest'
]

{ #category : 'tests' }
PMAccuracyFindKeyTest >> testFindKeyReturnsPropertyWhenSelectorIsSuffixOfInitializePropertyMessage [
	| selector |
	selector := 'Aaa'.

	self assertKeyFor: selector equals: 'Aaa'
]
