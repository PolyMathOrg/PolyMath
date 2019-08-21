"
A PMConstantGenerator is still a number generator but a simple one :)
"
Class {
	#name : #PMConstantGenerator,
	#superclass : #PMNumberGenerator,
	#instVars : [
		'constant'
	],
	#category : #'Math-Random'
}

{ #category : #'instance-creation' }
PMConstantGenerator class >> constant: aNumber [
	^ self new constant: aNumber ; yourself
]

{ #category : #accessing }
PMConstantGenerator >> constant: aConstant [
	constant := aConstant
]

{ #category : #accessing }
PMConstantGenerator >> generator: aRandomGenerator [
	"Do nothing."
	^ self
]

{ #category : #'stream access' }
PMConstantGenerator >> next [
	^ constant
]
