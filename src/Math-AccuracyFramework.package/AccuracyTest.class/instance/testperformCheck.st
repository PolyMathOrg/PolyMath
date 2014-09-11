tests
testperformCheck
	a extractFromResults: 'bla' which: 2 onlyOne: false."for setting numberOfResults"
	self assert: (a performCheck: 'Aaa') =  #(#(1 1)).
	a extractFromResults: 'bla' which: 1 onlyOne: true."for setting numberOfResults"
	a iterations:3.
	self assert: (a performCheck: 'Fff') = #(#(0 0 1 0)#(0 0 1 0)#(0 0 1 0)).