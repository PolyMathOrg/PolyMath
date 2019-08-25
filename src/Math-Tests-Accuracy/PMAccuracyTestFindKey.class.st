Class {
	#name : #PMAccuracyTestFindKey,
	#superclass : #TestCase,
	#category : #'Math-Tests-Accuracy'
}

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
