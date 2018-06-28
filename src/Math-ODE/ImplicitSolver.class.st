Class {
	#name : #ImplicitSolver,
	#superclass : #ODESolver,
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
ImplicitSolver class >> stepperClass [
	^ ImplicitStepper.
]

{ #category : #'announcement hooks' }
ImplicitSolver >> announcementClass [

	^ ImplicitSolverAnnouncement 
]

{ #category : #'announcement hooks' }
ImplicitSolver >> announcerClass [

	^ ImplicitAnnouncer
]
