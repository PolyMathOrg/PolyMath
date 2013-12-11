example
demo
"self demo"
| solver system recorder stepper |
"Transcript openAsMorphLabel: 'TransciptRecorderDemo'."
Transcript 
	cr;
	show: 'TranscriptRecorder demo start'; 
	cr.

system := ExplicitSystem block: [:x : t | x collect: [:ea | t]].
stepper := RungeKuttaStepper onSystem: system.
solver := (ExplicitSolver new) stepper: stepper; system: system.
	
Transcript show: system block; cr.
recorder := self forSolver:  solver.
"this should be shown, explicit solution is x=1/2*t^2"
solver solve: system  startState: #(1 2 3 4) startTime: 0 endTime: 2  stepSize: 0.1.
recorder unsubscribe.
"this should not be shown"
solver solve: system  startState: #(0) startTime: 0 endTime: 5 stepSize: 0.1.
Transcript show: 'TranscriptRecorder demo end'; cr