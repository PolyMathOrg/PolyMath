private
checkDoublePrecisionSerieVsFloat: serie forFunction: func 
	^serie reject: [:y |
		| farb |
		farb := self checkDoublePrecision: y forFunction: func nBits: Float precision.
		[(y asFloat perform: func) = farb] on: ZeroDivide do: [false]]