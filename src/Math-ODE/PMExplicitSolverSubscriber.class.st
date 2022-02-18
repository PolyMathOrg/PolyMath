"
An ExplicitSolverSubscriber implements the minimal behavior to attach to an ODESolver and receive ExplicitSolverAnnouncements. Subclasses should override block to determine appropriate behavior.

"
Class {
	#name : #PMExplicitSolverSubscriber,
	#superclass : #Object,
	#instVars : [
		'announcers',
		'block'
	],
	#category : #'Math-ODE'
}

{ #category : #'instance creation' }
PMExplicitSolverSubscriber class >> forAnnouncer: anAnnouncer [
	^ self new forAnnouncer: anAnnouncer.
]

{ #category : #'instance creation' }
PMExplicitSolverSubscriber class >> forSolver: anODESolver [
	^ self forAnnouncer: anODESolver announcer
]

{ #category : #accessing }
PMExplicitSolverSubscriber >> announcers [
	
	^ announcers
]

{ #category : #accessing }
PMExplicitSolverSubscriber >> block [
	^ block
]

{ #category : #accessing }
PMExplicitSolverSubscriber >> block: aFormatBlock [
	block := aFormatBlock 
]

{ #category : #accessing }
PMExplicitSolverSubscriber >> defaultBlock [
	^ self subclassResponsibility 
]

{ #category : #subscription }
PMExplicitSolverSubscriber >> forAnnouncer: anAnnouncer [
	anAnnouncer when: PMExplicitSolverAnnouncement do: self block.
	announcers add: anAnnouncer.
]

{ #category : #'initialize-release' }
PMExplicitSolverSubscriber >> initialize [
	super initialize.
	announcers := IdentitySet new.
	block := self defaultBlock.
	^ self
]

{ #category : #'initialize-release' }
PMExplicitSolverSubscriber >> release [
	"stop announcers from sending messages"
	self unsubscribe.
	super release.
]

{ #category : #subscription }
PMExplicitSolverSubscriber >> unsubscribe [
	announcers do: [:ea | self unsubscribe: ea].

]

{ #category : #subscription }
PMExplicitSolverSubscriber >> unsubscribe: anAnnouncer [
	anAnnouncer unsubscribe: self.
	announcers remove: anAnnouncer ifAbsent: [].
]
