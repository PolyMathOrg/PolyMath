testing-trigonometry
testArcSin
	<timeout: 10 "seconds">
	| badArcSin |
	badArcSin := self checkDoublePrecisionSerieVsFloat: self inverseTrigonometricSerie forFunction: #arcSin.
	badArcSin isEmpty ifFalse: [Transcript cr; show: 'bad arcSin for ' , badArcSin printString]