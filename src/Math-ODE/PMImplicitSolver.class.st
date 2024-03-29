Class {
	#name : #PMImplicitSolver,
	#superclass : #PMODESolver,
	#category : #'Math-ODE'
}

{ #category : #private }
PMImplicitSolver class >> stepperClass [
	^ PMImplicitStepper
]

{ #category : #'announcement hooks' }
PMImplicitSolver >> announcementClass [

	^ PMImplicitSolverAnnouncement
]

{ #category : #'announcement hooks' }
PMImplicitSolver >> announcerClass [

	^ PMImplicitAnnouncer
]
