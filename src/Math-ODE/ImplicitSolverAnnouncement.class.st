"
An ImplicitSolverAnnouncement is a record of a step in an implicit system. It contains a time and a state.

"
Class {
	#name : #ImplicitSolverAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		't',
		'state'
	],
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
ImplicitSolverAnnouncement class >> state: aState time: aTime [
	^ self new state: aState time: aTime; yourself.
]

{ #category : #accessing }
ImplicitSolverAnnouncement >> state [
	^ state
]

{ #category : #accessing }
ImplicitSolverAnnouncement >> state: aState time: aTime [
	state:= aState.
	t := aTime.
]

{ #category : #accessing }
ImplicitSolverAnnouncement >> time [
	^ t
]
