"
An ExplicitSolverAnnouncement is a record of a step in an explicit system. It contains a time and a state.
"
Class {
	#name : #ExplicitSolverAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		't',
		'state'
	],
	#category : 'Math-ODE'
}

{ #category : #accessing }
ExplicitSolverAnnouncement class >> state: aState time: aTime [
	^ self new state: aState time: aTime; yourself.
]

{ #category : #accessing }
ExplicitSolverAnnouncement >> state [
	^ state
]

{ #category : #accessing }
ExplicitSolverAnnouncement >> state: aState time: aTime [
	state:= aState.
	t := aTime.
]

{ #category : #accessing }
ExplicitSolverAnnouncement >> time [
	^ t
]
