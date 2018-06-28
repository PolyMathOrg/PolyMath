Class {
	#name : #ExplicitSolver,
	#superclass : #ODESolver,
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
ExplicitSolver class >> stepperClass [
	^ ExplicitStepper.
]

{ #category : #'announcement hooks' }
ExplicitSolver >> announcementClass [
	^ ExplicitSolverAnnouncement
]

{ #category : #'announcement hooks' }
ExplicitSolver >> announcerClass [

	^ ExplicitAnnouncer 
]
