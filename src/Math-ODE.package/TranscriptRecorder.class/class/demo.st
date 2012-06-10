example
demo
| solver system recorder |
Transcript openAsMorphLabel: 'TransciptRecorderDemo'.
Transcript 
	cr;
	show: 'TranscriptRecorder demo start'; 
	cr.
solver := RK4Solver new.
system := ExplicitSystem block: [:x : t | x collect: [:ea | t]].
Transcript show: system block; cr.
recorder := self forSolver:  solver.
"this should be shown, explicit solution is x=1/2*t^2"
solver solve: system  startState: #(1 2 3 4) startTime: 0 endTime: 2  stepSize: 0.1.
recorder unsubscribe.
"this should not be shown"
solver solve: system  startState: #(0) startTime: 0 endTime: 5 stepSize: 0.1.
Transcript show: 'TranscriptRecorder demo end'; cr.