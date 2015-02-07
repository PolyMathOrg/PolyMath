testing-functions
testExp
	<timeout: 10 "seconds">
	| badExp serie |
	serie := ((-20 to: 20) collect: [:e |e asFloat]).
	badExp := self checkDoublePrecisionSerieVsFloat: serie forFunction: #exp.
	badExp isEmpty ifFalse: [Transcript cr; show: 'bad exp for ' , badExp printString]