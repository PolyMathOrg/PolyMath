testing-functions
testLn
	<timeout: 10 "seconds">
	| badLn serie |
	serie := ((1 to: 100) collect: [:e |e asFloat]).
	badLn := self checkDoublePrecisionSerieVsFloat: serie forFunction: #ln.
	badLn isEmpty ifFalse: [Transcript cr; show: 'bad ln for ' , badLn printString]