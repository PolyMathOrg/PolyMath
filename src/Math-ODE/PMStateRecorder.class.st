"
A StateRecorder captures each step in an ODESolvers history. 

It stores these as a sorted collection of StateTime object, in increasing time order.
"
Class {
	#name : #PMStateRecorder,
	#superclass : #PMExplicitSolverSubscriber,
	#instVars : [
		'states'
	],
	#category : #'Math-ODE'
}

{ #category : #example }
PMStateRecorder class >> demo [

	"self demo"

	| solver system recorder stepper |
	system := PMExplicitSystem block: [ :x :t | x collect: [ :i | t ] ]. "exact solution x = 0.5 * t squared + x0"

	stepper := PMRungeKuttaStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system.

	recorder := self forSolver: solver.
	"an example of moving backward in time with fractional dt"
	solver
		solve: system
		startState: #( 3 1 )
		startTime: 2
		endTime: 0
		stepSize: -1 / 10.

	recorder unsubscribe.

	"these wont be captured. an example of moving forward in time with float dt."
	solver
		solve: system
		startState: #( 0 )
		startTime: 0
		endTime: 5
		stepSize: 0.1.

	recorder states inspect
]

{ #category : #accessing }
PMStateRecorder >> add: aState at: aTime [
	states add:  (PMStateTime state: aState time: aTime)
]

{ #category : #accessing }
PMStateRecorder >> defaultBlock [
	^ [:ann | self add: ann state at: ann time]
]

{ #category : #'initialize-release' }
PMStateRecorder >> initialize [
	super initialize.
	states := SortedCollection sortBlock: [:x :y | x time < y time].
	^ self
]

{ #category : #accessing }
PMStateRecorder >> states [
	^ states
]
