tests
testperformCheck
|b|
	a extractFromResults: 'bla' which: 2 onlyOne: false."for setting numberOfResults"
	self assert: (a performCheck: 'Aaa') =  #(#(1 1)).
	a extractFromResults: 'bla' which: 1 onlyOne: true."for setting numberOfResults"
	a iterations:3.
	b:=a performCheck: 'Fff'.
	self assert: (b first first =  0).
	self assert: (b second third =  1).
	self assert: (b third at:5) isNaN .