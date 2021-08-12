Class {
	#name : #ShapeMismatch,
	#superclass : #Error,
	#category : #'Math-Matrix'
}

{ #category : #accessing }
ShapeMismatch >> messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #printing }
ShapeMismatch >> standardMessageText [
	"Generate a standard textual description"
	
	^ 'NDArray shapes do not match'
]
