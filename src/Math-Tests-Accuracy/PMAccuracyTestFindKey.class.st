"
This test case examines the findKey: message which was extracted out 
and takes a selector as the argument, thereby making it more unit testable.

"
Class {
	#name : #PMAccuracyTestFindKey,
	#superclass : #TestCase,
	#category : #'Math-Tests-Accuracy'
}

{ #category : #tests }
PMAccuracyTestFindKey >> testThatAllTheRestIsReturnedWhenSelectorIsInitialize [
	"
	when the selector is 'initialize' the method returns 'AllTheRest'.
	At the moment this is a regression test as it's difficult to understand
	reasoning behind the code
	"

	| example selector |
	selector := 'initialize'.
	example := PMAccuracyTestExample new.
	
	self assert: (example findKey: selector) equals: 'AllTheRest'
]

{ #category : #tests }
PMAccuracyTestFindKey >> testThatBlankStringIsReturnedWhenTheSelectorDoesNotExist [
	"comment stating purpose of message"

	| example selector |
	selector := 'NON_EXISTENT'.
	example := PMAccuracyTestExample new.
	
	self assert: (example findKey: selector) equals: ''
]

{ #category : #tests }
PMAccuracyTestFindKey >> testThatMatchingMessageIsReturnedWhenSelectorIsSuffixOfExistingMessage [
	"Given the selector exists (Aaa, since initializeAaa is a defined message), 
	the matching message is returned"

	| example selector |
	selector := 'Aaa'.
	example := PMAccuracyTestExample new.
	
	self assert: (example findKey: selector) equals: 'Aaa'
]
