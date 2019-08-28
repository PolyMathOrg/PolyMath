"
This test case examines the findKey: message which was extracted out 
and takes a selector as the argument, thereby making it more unit testable.

"
Class {
	#name : #PMAccuracyFindKey,
	#superclass : #TestCase,
	#instVars : [
		'example'
	],
	#category : #'Math-Tests-Accuracy'
}

{ #category : #tests }
PMAccuracyFindKey >> assertKey: selector equals: expected [
	self assert: (example findKey: selector) equals: expected
]

{ #category : #running }
PMAccuracyFindKey >> setUp [
	super setUp .
	example := PMAccuracyTestExample new.
]

{ #category : #tests }
PMAccuracyFindKey >> testThatAllTheRestIsReturnedWhenSelectorIsInitialize [
	"
	when the selector is 'initialize' the method returns 'AllTheRest'.
	At the moment this is a regression test as it's difficult to understand
	reasoning behind the code
	"

	| selector |
	selector := 'initialize'.
	
	self assertKey: selector equals: 'AllTheRest'
]

{ #category : #tests }
PMAccuracyFindKey >> testThatBlankStringIsReturnedWhenTheSelectorDoesNotExist [
	"
	This is a regression test where when a selector does not exist, the message
	returns a blank string. Before, it used to raise an error, which was
	preventing test coverage from being evaluated by smalltalkCI.
	"
	| selector |
	selector := 'NON_EXISTENT'.
	
	self assertKey: selector equals: ''
]

{ #category : #tests }
PMAccuracyFindKey >> testThatMatchingMessageIsReturnedWhenSelectorIsSuffixOfExistingMessage [
	"Given the selector exists (Aaa, since initializeAaa is a defined message), 
	the matching message is returned"

	| selector |
	selector := 'Aaa'.
	
	self assertKey: selector equals: 'Aaa'
]
