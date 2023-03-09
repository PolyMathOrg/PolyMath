"
An ImplicitSolverAnnouncement is a record of a step in an implicit system. It contains a time and a state.

"
Class {
	#name : #PMImplicitSolverAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		't',
		'state'
	],
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMImplicitSolverAnnouncement class >> state: aState time: aTime [
	^ self new state: aState time: aTime; yourself
]

{ #category : #accessing }
PMImplicitSolverAnnouncement >> state [
	^ state
]

{ #category : #accessing }
PMImplicitSolverAnnouncement >> state: aState time: aTime [
	state:= aState.
	t := aTime
]

{ #category : #accessing }
PMImplicitSolverAnnouncement >> time [
	^ t
]
