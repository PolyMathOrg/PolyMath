"
This test case exercises the findKey: message with some regression tests.
"
Class {
	#name : #PMAccuracyFindKeyTest,
	#superclass : #TestCase,
	#instVars : [
		'accuracy'
	],
	#category : #'Math-Tests-Accuracy'
}

{ #category : #running }
PMAccuracyFindKeyTest >> setUp [ 
	super setUp.
	accuracy := PMAccuracyTestExample new.
	
]

{ #category : #tests }
PMAccuracyFindKeyTest >> testFindKeyReturnsAllTheRestStringWhenSelectorCorrespondsToNonExistentProperty [
	| selector |
	selector := 'NonExistent'.
	self assert: (accuracy findKey: selector) equals: 'AllTheRest'
]

{ #category : #tests }
PMAccuracyFindKeyTest >> testFindKeyReturnsAllTheRestStringWhenSelectorIsInitialize [
	| selector |
	selector := 'initialize'.
	
	self assert: (accuracy findKey: selector) equals: 'AllTheRest'
]

{ #category : #tests }
PMAccuracyFindKeyTest >> testFindKeyReturnsPropertyWhenSelectorIsSuffixOfInitializePropertyMessage [
	| selector |
	selector := 'Aaa'.
	self assert: (accuracy findKey: selector) equals: selector
]
