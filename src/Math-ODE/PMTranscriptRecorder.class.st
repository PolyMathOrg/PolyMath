"
A TranscriptRecorder is a very primitive tool.
It prints a message to transcript when a step is taken by the solver.

The demo class method shows an example.
"
Class {
	#name : #PMTranscriptRecorder,
	#superclass : #PMExplicitSolverSubscriber,
	#category : #'Math-ODE'
}

{ #category : #example }
PMTranscriptRecorder class >> demo [
"self demo"
| solver system recorder stepper |
"Transcript openAsMorphLabel: 'TransciptRecorderDemo'."
Transcript 
	cr;
	show: 'TranscriptRecorder demo start'; 
	cr.

system := PMExplicitSystem block: [:x : t | x collect: [:ea | t]].
stepper := PMRungeKuttaStepper onSystem: system.
solver := (PMExplicitSolver new) stepper: stepper; system: system.
	
Transcript show: system block; cr.
recorder := self forSolver:  solver.
"this should be shown, explicit solution is x=1/2*t^2"
solver solve: system  startState: #(1 2 3 4) startTime: 0 endTime: 2  stepSize: 0.1.
recorder unsubscribe.
"this should not be shown"
solver solve: system  startState: #(0) startTime: 0 endTime: 5 stepSize: 0.1.
Transcript show: 'TranscriptRecorder demo end'; cr
]

{ #category : #accessing }
PMTranscriptRecorder >> defaultBlock [
	"this is the default transcript output"
	^  [:ann | Transcript show: 'state: ';
					show: ann state asString ;
					tab; tab;
					show: ' time: ';
					show: ann time asString; 
					cr ]

]
