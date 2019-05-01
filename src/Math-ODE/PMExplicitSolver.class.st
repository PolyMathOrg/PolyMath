Class {
	#name : #PMExplicitSolver,
	#superclass : #PMODESolver,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMExplicitSolver class >> stepperClass [
	^ PMExplicitStepper.
]

{ #category : #'announcement hooks' }
PMExplicitSolver >> announcementClass [
	^ PMExplicitSolverAnnouncement
]

{ #category : #'announcement hooks' }
PMExplicitSolver >> announcerClass [

	^ PMExplicitAnnouncer 
]
