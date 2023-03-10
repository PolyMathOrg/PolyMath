"
An ExplicitSolverAnnouncement is a record of a step in an explicit system. It contains a time and a state.
"
Class {
	#name : #PMExplicitSolverAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		't',
		'state'
	],
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMExplicitSolverAnnouncement class >> state: aState time: aTime [
	^ self new state: aState time: aTime; yourself
]

{ #category : #accessing }
PMExplicitSolverAnnouncement >> state [
	^ state
]

{ #category : #accessing }
PMExplicitSolverAnnouncement >> state: aState time: aTime [
	state:= aState.
	t := aTime
]

{ #category : #accessing }
PMExplicitSolverAnnouncement >> time [
	^ t
]
