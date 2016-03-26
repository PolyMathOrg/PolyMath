tests
testperformCheck
	| b |
	a extractFromResults: 'bla' which: 2 onlyOne: false.	"for setting numberOfResults"
	self assert: (a performCheck: 'Aaa') equals: #(#(1 1)).
	a extractFromResults: 'bla' which: 1 onlyOne: true.	"for setting numberOfResults"
	a iterations: 3.
	b := a performCheck: 'Fff'.
	self assert: b first first equals: 0.
	self assert: b second third equals: 1.
	self assert: (b third at: 5) isNaN