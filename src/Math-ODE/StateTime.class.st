"
A StateTime class is a generalization of point. It holds both a state and a time.

We don't want to  use Point, since state may be a vector quantity, and the behavior of array @ number is a little off (it stores points in an array, what we want is the array itself in state, and the scalar quantity in time).
"
Class {
	#name : #StateTime,
	#superclass : #Object,
	#instVars : [
		'state',
		'time'
	],
	#category : 'Math-ODE'
}

{ #category : #'instance creation' }
StateTime class >> state: aState time: aTime [
	^ self new 
		state: aState;
		time: aTime.
]

{ #category : #printing }
StateTime >> printOn: aStream [
	"used for inspector. Using the point analogy"
	state printOn: aStream.
	aStream nextPut: $@.
	time printOn: aStream.

]

{ #category : #accessing }
StateTime >> state [
	^ state
]

{ #category : #accessing }
StateTime >> state: anObject [
	state := anObject
]

{ #category : #accessing }
StateTime >> time [
	^ time
]

{ #category : #accessing }
StateTime >> time: anObject [
	time := anObject
]
