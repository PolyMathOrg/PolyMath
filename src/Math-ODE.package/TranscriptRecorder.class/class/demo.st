example
demo
| solver system recorder |
Transcript openAsMorphLabel: 'TransciptRecorderDemo'.
Transcript 
	cr;
	show: 'TranscriptRecorder demo start'; 
	cr.
solver := ODESolver new.
system := ExplicitSystem block: [:x :t | t].
recorder := self forSolver:  solver.
"this should be shown"
solver solve: system  startState: 0 startTime: 0 endTime: 2  stepSize: 0.1.
recorder unsubscribe.
"this should not be shown"
solver solve: system  startState: 0 startTime: 0 endTime: 5 stepSize: 0.1.
Transcript show: 'TranscriptRecorder demo end'; cr.