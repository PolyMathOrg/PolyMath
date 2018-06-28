"
An ExplicitSolverSubscriber implements the minimal behavior to attach to an ODESolver and receive ExplicitSolverAnnouncements. Subclasses should override block to determine appropriate behavior.

"
Class {
	#name : #ExplicitSolverSubscriber,
	#superclass : #Object,
	#instVars : [
		'announcers',
		'block'
	],
	#category : 'Math-ODE'
}

{ #category : #'instance creation' }
ExplicitSolverSubscriber class >> forAnnouncer: anAnnouncer [
	^ self new forAnnouncer: anAnnouncer.
]

{ #category : #'instance creation' }
ExplicitSolverSubscriber class >> forSolver: anODESolver [
	^ self forAnnouncer: anODESolver announcer
]

{ #category : #accessing }
ExplicitSolverSubscriber >> announcers [
	
	^ announcers
]

{ #category : #accessing }
ExplicitSolverSubscriber >> block [
	^ block
]

{ #category : #accessing }
ExplicitSolverSubscriber >> block: aFormatBlock [
	block := aFormatBlock 
]

{ #category : #accessing }
ExplicitSolverSubscriber >> defaultBlock [
	^ self subclassResponsibility 
]

{ #category : #subscription }
ExplicitSolverSubscriber >> forAnnouncer: anAnnouncer [
	anAnnouncer on: ExplicitSolverAnnouncement do: self block.
	announcers add: anAnnouncer.
]

{ #category : #'initialize-release' }
ExplicitSolverSubscriber >> initialize [
	super initialize.
	announcers := IdentitySet new.
	block := self defaultBlock.
	^ self
]

{ #category : #'initialize-release' }
ExplicitSolverSubscriber >> release [
	"stop announcers from sending messages"
	self unsubscribe.
	super release.
]

{ #category : #subscription }
ExplicitSolverSubscriber >> unsubscribe [
	announcers do: [:ea | self unsubscribe: ea].

]

{ #category : #subscription }
ExplicitSolverSubscriber >> unsubscribe: anAnnouncer [
	anAnnouncer unsubscribe: self.
	announcers remove: anAnnouncer ifAbsent: [].
]
