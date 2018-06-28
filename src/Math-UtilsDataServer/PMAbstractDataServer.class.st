"
I act as an interface for potential data server.
My subclasses should implement the following methods: atEnd, close, next, open, reset.
"
Class {
	#name : #PMAbstractDataServer,
	#superclass : #Object,
	#category : 'Math-UtilsDataServer'
}

{ #category : #information }
PMAbstractDataServer >> atEnd [
	"Answers true if there is no more data element."
	self subclassResponsibility
]

{ #category : #operation }
PMAbstractDataServer >> close [
	"Close the data stream (must be implemented by subclass)."
]

{ #category : #operation }
PMAbstractDataServer >> next [
	"Answers the next element on the stream."
	self subclassResponsibility
]

{ #category : #operation }
PMAbstractDataServer >> open [
	"Open the data stream (must be implemented by subclass)."
	self subclassResponsibility
]

{ #category : #operation }
PMAbstractDataServer >> reset [
	"Reset the position of the data stream to the beginning."
	self subclassResponsibility
]
