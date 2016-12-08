testing-trigonometry
testCos
	<timeout: 30 "seconds">
	| badCos |
	badCos := self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #cos.
	badCos isEmpty ifFalse: [Transcript cr; show: 'bad cos for angles (degrees) ' , (badCos collect: [:i | i radiansToDegrees rounded]) printString]