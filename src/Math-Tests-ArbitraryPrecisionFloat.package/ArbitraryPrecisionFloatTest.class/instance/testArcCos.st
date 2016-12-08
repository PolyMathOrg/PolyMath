testing-trigonometry
testArcCos
	<timeout: 10 "seconds">
	| badArcCos |
	badArcCos := self checkDoublePrecisionSerieVsFloat: self inverseTrigonometricSerie forFunction: #arcCos.
	badArcCos isEmpty ifFalse: [Transcript cr; show: 'bad arcCos for ' , badArcCos printString]