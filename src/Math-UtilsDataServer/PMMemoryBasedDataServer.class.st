"
I take the data I will serve via the message data: aCollection.
Once done I will be able to serve the data until none is available. 
"
Class {
	#name : #PMMemoryBasedDataServer,
	#superclass : #PMAbstractDataServer,
	#instVars : [
		'data',
		'position'
	],
	#category : 'Math-UtilsDataServer'
}

{ #category : #information }
PMMemoryBasedDataServer >> atEnd [
	"Answers true if there is no more data element."
	^data size < position
]

{ #category : #initialization }
PMMemoryBasedDataServer >> data: anOrderedCollection [
	
	data := anOrderedCollection.
	self reset
]

{ #category : #information }
PMMemoryBasedDataServer >> dimension [
	"Answers the dimension of the vectors catered by the receiver."
	^ data first size
]

{ #category : #operation }
PMMemoryBasedDataServer >> next [
	"Answers the next element on the stream."
	| answer |
	answer := data at: position.
	position := position + 1.
	^answer
]

{ #category : #operation }
PMMemoryBasedDataServer >> open [
	"Open the data stream (must be implemented by subclass)."
	self reset
]

{ #category : #operation }
PMMemoryBasedDataServer >> reset [
	"Reset the position of the data stream to the beginning."
	position := 1.
]
