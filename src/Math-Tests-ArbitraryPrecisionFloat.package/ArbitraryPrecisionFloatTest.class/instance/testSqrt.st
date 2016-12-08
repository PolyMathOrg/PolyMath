testing-functions
testSqrt
	<timeout: 10 "seconds">
	| badSqrt serie |
	"knowing that (10**3) < (2**10), 100 bits are enough for representing 10**30 exactly"
	self assert: ((10 raisedTo: 30) asArbitraryPrecisionFloatNumBits: 100) sqrt = (10 raisedTo: 15).

	serie := ((0 to: 20) collect: [:e | e asFloat]) , ((2 to: 20) collect: [:e | e reciprocal asFloat]).
	badSqrt := self checkDoublePrecisionSerieVsFloat: serie forFunction: #sqrt.
	badSqrt isEmpty ifFalse: [Transcript cr; show: 'bad sqrt for ' , badSqrt printString]