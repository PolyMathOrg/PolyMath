testing-trigonometry
testArcTan
	<timeout: 10 "seconds">
	| badArcTan serie |
	serie := ((-50 to: 50) collect: [:e | (e / 10) asFloat]).
	badArcTan := self checkDoublePrecisionSerieVsFloat: serie forFunction: #arcTan.
	badArcTan isEmpty ifFalse: [Transcript cr; show: 'bad arcTan for ' , badArcTan printString]