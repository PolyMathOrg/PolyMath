"
This test case examines the findKey: message which was extracted out 
and takes a selector as the argument, thereby making it more unit testable.

"
Class {
	#name : #PMAccuracyTestFindKey,
	#superclass : #TestCase,
	#instVars : [
		'example'
	],
	#category : #'Math-Tests-Accuracy'
}

{ #category : #running }
PMAccuracyTestFindKey >> setUp [
	super setUp .
	example := PMAccuracyTestExample new.
]

{ #category : #tests }
PMAccuracyTestFindKey >> testThatAllTheRestIsReturnedWhenSelectorIsInitialize [
	"
	when the selector is 'initialize' the method returns 'AllTheRest'.
	At the moment this is a regression test as it's difficult to understand
	reasoning behind the code
	"

	| selector |
	selector := 'initialize'.
	
	self assert: (example findKey: selector) equals: 'AllTheRest'
]

{ #category : #tests }
PMAccuracyTestFindKey >> testThatBlankStringIsReturnedWhenTheSelectorDoesNotExist [
	"comment stating purpose of message"

	| selector |
	selector := 'NON_EXISTENT'.
	
	self assert: (example findKey: selector) equals: ''
]

{ #category : #tests }
PMAccuracyTestFindKey >> testThatMatchingMessageIsReturnedWhenSelectorIsSuffixOfExistingMessage [
	"Given the selector exists (Aaa, since initializeAaa is a defined message), 
	the matching message is returned"

	| selector |
	selector := 'Aaa'.
	
	self assert: (example findKey: selector) equals: 'Aaa'
]
