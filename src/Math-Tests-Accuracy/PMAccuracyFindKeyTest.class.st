"
This test case exercises the findKey: message with some regression tests.
"
Class {
	#name : #PMAccuracyFindKeyTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Accuracy'
}

{ #category : #tests }
PMAccuracyFindKeyTest >> testFindKeyReturnsAllTheRestStringWhenSelectorCorrespondsToNonExistentProperty [
	| accuracy |
	accuracy := PMAccuracyTestExample new.
	
	self assert: (accuracy findKey: 'NonExistent') equals: 'AllTheRest'
]

{ #category : #tests }
PMAccuracyFindKeyTest >> testFindKeyReturnsAllTheRestStringWhenSelectorIsInitialize [
	| accuracy selector |
	accuracy := PMAccuracyTestExample new.
	selector := 'initialize'.
	
	self assert: (accuracy findKey: selector) equals: 'AllTheRest'
]

{ #category : #tests }
PMAccuracyFindKeyTest >> testFindKeyReturnsPropertyWhenSelectorIsSuffixOfInitializePropertyMessage [
	| accuracy |
	accuracy := PMAccuracyTestExample new.
	
	self assert: (accuracy findKey: 'Aaa') equals: 'Aaa'
]
