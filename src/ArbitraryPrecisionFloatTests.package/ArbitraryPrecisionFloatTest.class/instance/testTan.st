testing-trigonometry
testTan
	<timeout: 30 "seconds">
	| badTan |
	badTan := self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #tan.
	badTan isEmpty ifFalse: [Transcript cr; show: 'bad tan for angles (degrees) ' , (badTan collect: [:i | i radiansToDegrees rounded]) printString]