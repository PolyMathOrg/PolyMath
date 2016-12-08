testing-trigonometry
testSin
	<timeout: 30 "seconds">
	| badSin |
	badSin := self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #sin.
	badSin isEmpty ifFalse: [Transcript cr; show: 'bad sin for angles (degrees) ' , (badSin collect: [:i | i radiansToDegrees rounded]) printString]